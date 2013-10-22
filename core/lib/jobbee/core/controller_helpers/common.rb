module Jobbee
  module Core
    module ControllerHelpers
      module Common
        extend ActiveSupport::Concern
        included do
          helper_method :title
          helper_method :title=
          helper_method :accurate_title

          layout :get_layout

          before_filter :set_user_language

          protected

          # Creates the hash that is sent as the payload for all notifications. Specific notifications will
          # add additional keys as appropriate. Override this method if you need additional data when
          # responding to a notification
          def default_notification_payload
            {:user => try_jobbee_current_user}
          end

          # can be used in views as well as controllers.
          # e.g. <% self.title = 'This is a custom title for this view' %>
          attr_writer :title

          def title
            title_string = @title.present? ? @title : accurate_title
            if title_string.present?
              if Jobbee::Config[:always_put_site_name_in_title]
                [title_string, default_title].join(' - ')
              else
                title_string
              end
            else
              default_title
            end
          end

          def default_title
            Jobbee::Config[:site_name]
          end

          # this is a hook for subclasses to provide title
          def accurate_title
            Jobbee::Config[:default_seo_title]
          end

          def render_404(exception = nil)
            respond_to do |type|
              type.html { render :status => :not_found, :file    => "#{::Rails.root}/public/404", :formats => [:html], :layout => nil}
              type.all  { render :status => :not_found, :nothing => true }
            end
          end

          private

          def set_user_language
            locale = session[:locale]
            locale ||= config_locale if respond_to?(:config_locale, true)
            locale ||= Rails.application.config.i18n.default_locale
            locale ||= I18n.default_locale unless I18n.available_locales.map(&:to_s).include?(locale)
            I18n.locale = locale
          end

          # Returns which layout to render.
          # 
          # You can set the layout you want to render inside your Jobbee configuration with the +:layout+ option.
          # 
          # Default layout is: +app/views/Jobbee/layouts/jobbee_application+
          # 
          def get_layout
            layout ||= Jobbee::Config[:layout]
          end

        end
      end
    end
  end
end
