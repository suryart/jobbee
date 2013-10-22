module Jobbee
  module Core
    module ControllerHelpers
      module Search
        def build_searcher params
          Jobbee::Config.searcher_class.new(params).tap do |searcher|
            searcher.current_user = try_jobbee_current_user
          end
        end
      end
    end
  end
end
