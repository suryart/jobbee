module Jobbee
  module ViewContext
    def self.context=(context)
      @context = context
    end

    def self.context
      @context
    end

    def view_context
      super.tap do |context|
        Jobbee::ViewContext.context = context
      end
    end
  end
end