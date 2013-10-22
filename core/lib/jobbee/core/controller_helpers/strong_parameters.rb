module Jobbee
  module Core
    module ControllerHelpers
      module StrongParameters
        def permitted_attributes
          Jobbee::PermittedAttributes
        end

        delegate *Jobbee::PermittedAttributes::ATTRIBUTES,
                 :to => :permitted_attributes,
                 :prefix => :permitted

        def permitted_payment_attributes
          permitted_attributes.applicant_attributes + [
            :source_attributes => permitted_source_attributes
          ]
        end
      end
    end
  end
end
