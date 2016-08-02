module Jobbee
  module Backend
    class Engine < ::Rails::Engine
      config.middleware.use "Jobbee::Backend::Middleware::SeoAssist"

      config.autoload_paths += %W(#{config.root}/lib)

      # filter sensitive information during logging
      initializer "jobbee.params.filter" do |app|
        app.config.filter_parameters += [:password, :password_confirmation, :contact_number]
      end

      # sets the manifests / assets to be precompiled, even when initialize_on_precompile is false
      initializer "jobbee.assets.precompile", :group => :all do |app|
        app.config.assets.precompile += %w[
          admin/all.*
          admin/candidates/all.*
          admin/companies/all.*
          admin/consultancies/all.*
        ]
      end
    end
  end
end