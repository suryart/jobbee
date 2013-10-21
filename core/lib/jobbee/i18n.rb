require 'i18n'
require 'active_support/core_ext/array/extract_options'
require 'jobbee/i18n/base'

module Jobbee
  extend ActionView::Helpers::TranslationHelper

  class << self
    # Add jobbee namespace and delegate to Rails TranslationHelper for some nice
    # extra functionality. e.g return reasonable strings for missing translations
    def translate(*args)
      @virtual_path = virtual_path

      options = args.extract_options!
      options[:scope] = [*options[:scope]].unshift(:jobbee)
      args << options
      super(*args)
    end

    alias_method :t, :translate

    def context
      Jobbee::ViewContext.context
    end

    def virtual_path
      if context
        path = context.instance_variable_get("@virtual_path")

        if path
          path.gsub(/jobbee/, '')
        end
      end
    end
  end
end