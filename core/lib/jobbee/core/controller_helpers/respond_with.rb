module ActionController
  class Base
    def respond_with(*resources, &block)
      raise "In order to use respond_with, first you need to declare the formats your " <<
            "controller responds to in the class level" if self.class.mimes_for_respond_to.empty?

      if collector = retrieve_collector_from_mimes(&block)
        options = resources.size == 1 ? {} : resources.extract_options!

        if defined_response = collector.response and !Jobbee::BaseController.jobbee_responders.keys.include?(self.class.to_s.to_sym)
          if action = options.delete(:action)
            render :action => action
          else
            defined_response.call
          end
        else
          # The action name is needed for processing
          options.merge!(:action_name => action_name.to_sym)
          # If responder is not specified then pass in Jobbee::Responder
          (options.delete(:responder) || Jobbee::Responder).call(self, resources, options)
        end
      end
    end
  end
end

module Jobbee
  module Core
    module ControllerHelpers
      module RespondWith
        extend ActiveSupport::Concern

        included do
          cattr_accessor :jobbee_responders
          self.jobbee_responders = {}
        end

        module ClassMethods
          def clear_overrides!
            self.jobbee_responders = {}
          end

          def respond_override(options={})
            unless options.blank?
              action_name = options.keys.first
              action_value = options.values.first

              if action_name.blank? || action_value.blank?
                raise ArgumentError, "invalid values supplied #{options.inspect}"
              end

              format_name = action_value.keys.first
              format_value = action_value.values.first

              if format_name.blank? || format_value.blank?
                raise ArgumentError, "invalid values supplied #{options.inspect}"
              end

              if format_value.is_a?(Proc)
                options = {action_name.to_sym => {format_name.to_sym => {:success => format_value}}}
              end

              self.jobbee_responders.deep_merge!(self.name.to_sym => options)
            end
          end
        end
      end
    end
  end
end
