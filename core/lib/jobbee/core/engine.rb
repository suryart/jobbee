module Jobbee
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Jobbee

      engine_name 'jobbee'
    end
  end
end