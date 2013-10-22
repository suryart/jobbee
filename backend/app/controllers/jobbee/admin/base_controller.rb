module Jobbee
  module Admin
    class BaseController < Jobbee::BaseController
      ssl_required

      helper 'jobbee/admin/navigation'
      helper 'jobbee/admin/tables'
      layout '/jobbee/layouts/admin'

      before_filter :check_alerts
      before_filter :authorize_admin

      protected
        def action
          params[:action].to_sym
        end

        def authorize_admin
          if respond_to?(:model_class, true) && model_class
            record = model_class
          else
            record = controller_name.to_sym
          end
          authorize! :admin, record
          authorize! action, record
        end

        # Need to generate an API key for a user due to some backend actions
        # requiring authentication to the Jobbee API
        def generate_admin_api_key
          if (user = try_jobbee_current_user) && user.jobbee_api_key.blank?
            user.generate_jobbee_api_key!
          end
        end

        def check_alerts
          return unless should_check_alerts?
          unless session.has_key? :alerts
            session[:alerts] = Jobbee::Alert.current(request.host)
            filter_dismissed_alerts
            Jobbee::Config.set :last_check_for_jobbee_alerts => DateTime.now.to_s
          end
        end

        def should_check_alerts?
          return false if !Rails.env.production? || !Jobbee::Config[:check_for_jobbee_alerts]

          last_check = Jobbee::Config[:last_check_for_jobbee_alerts]
          return true if last_check.blank?

          DateTime.parse(last_check) < 12.hours.ago
        end

        def flash_message_for(object, event_sym)
          resource_desc  = object.class.model_name.human
          resource_desc += " \"#{object.name}\"" if object.respond_to?(:name) && object.name.present?
          Jobbee.t(event_sym, :resource => resource_desc)
        end

        def render_js_for_destroy
          render :partial => '/jobbee/admin/shared/destroy'
        end

        # Index request for JSON needs to pass a CSRF token in order to prevent JSON Hijacking
        def check_json_authenticity
          return unless request.format.js? or request.format.json?
          return unless protect_against_forgery?
          auth_token = params[request_forgery_protection_token]
          unless (auth_token and form_authenticity_token == URI.unescape(auth_token))
            raise(ActionController::InvalidAuthenticityToken)
          end
        end

        def filter_dismissed_alerts
          return unless session[:alerts]
          dismissed = (Jobbee::Config[:dismissed_jobbee_alerts] || '').split(',')
          # If it's a string, something has gone wrong with the alerts service. Ignore it.
          if session[:alerts].is_a?(String)
            session[:alerts] = nil
          else
            session[:alerts].reject! { |a| dismissed.include? a["id"].to_s }
          end
        end

        def config_locale
          Jobbee::Backend::Config[:locale]
        end
    end
  end
end
