module Jobbee
  module Core
    module ControllerHelpers
      module Auth
        extend ActiveSupport::Concern

        included do
          before_filter :ensure_api_key
          helper_method :try_jobbee_current_user

          rescue_from CanCan::AccessDenied do |exception|
            unauthorized
          end
        end

        # Needs to be overriden so that we use Jobbee's Ability rather than anyone else's.
        def current_ability
          @current_ability ||= Jobbee::Ability.new(try_jobbee_current_user)
        end

        # Redirect as appropriate when an access request fails.  The default action is to redirect to the login screen.
        # Override this method in your controllers if you want to have special behavior in case the user is not authorized
        # to access the requested action.  For example, a popup window might simply close itself.
        def unauthorized
          if try_jobbee_current_user
            flash[:error] = Jobbee.t(:authorization_failure)
            redirect_to '/unauthorized'
          else
            store_location
            redirect_to respond_to?(:jobbee_login_path) ? jobbee_login_path : Jobbee.root_path
          end
        end

        def store_location
          # disallow return to login, logout, signup pages
          authentication_routes = [:jobbee_signup_path, :jobbee_login_path, :jobbee_logout_path]
          disallowed_urls = []
          authentication_routes.each do |route|
            if respond_to?(route)
              disallowed_urls << send(route)
            end
          end

          disallowed_urls.map!{ |url| url[/\/\w+$/] }
          unless disallowed_urls.include?(request.fullpath)
            session['jobbee_user_return_to'] = request.fullpath.gsub('//', '/')
          end
        end

        # proxy method to *possible* jobbee_current_user method
        # Authentication extensions (such as jobbee_auth_devise) are meant to provide jobbee_current_user
        def try_jobbee_current_user
          respond_to?(:jobbee_current_user) ? jobbee_current_user : nil
        end

        def redirect_back_or_default(default)
          redirect_to(session["jobbee_user_return_to"] || default)
          session["jobbee_user_return_to"] = nil
        end

        # Need to generate an API key for a user due to some actions potentially
        # requiring authentication to the Jobbee API
        def ensure_api_key
          if user = try_jobbee_current_user
            if user.respond_to?(:jobbee_api_key) && user.jobbee_api_key.blank?
              user.generate_jobbee_api_key!
            end
          end
        end
      end
    end
  end
end
