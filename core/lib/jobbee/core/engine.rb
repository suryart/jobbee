module Jobbee
  module Core
    class Engine < ::Rails::Engine 
      isolate_namespace Jobbee
      engine_name 'jobbee'

      config.autoload_paths += %W(#{config.root}/lib)
    end
  end
end