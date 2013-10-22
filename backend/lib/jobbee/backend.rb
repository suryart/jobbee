require 'rails/all'
require 'rails/generators'
require 'jquery-rails'
require 'jquery-ui-rails'
require 'deface'
require 'select2-rails'

require 'jobbee/core'

require 'jobbee/core/mail_settings'
require 'jobbee/core/mail_interceptor'

require 'jobbee/responder'

require 'jobbee/backend/engine'

if defined?(ActionView)
  require 'awesome_nested_set/helper'
  ActionView::Base.class_eval do
    include CollectiveIdea::Acts::NestedSet::Helper
  end
end