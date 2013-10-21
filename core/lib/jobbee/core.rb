require 'rails/all'
require 'active_merchant'
require 'acts_as_list'
require 'awesome_nested_set'
require 'cancan'
require 'kaminari'
require 'mail'
require 'paperclip'
require 'paranoia'
require 'ransack'
require 'state_machine'


module Jobbee

  mattr_accessor :user_class

  def self.user_class
    if @@user_class.is_a?(Class)
      raise "Jobbee.user_class MUST be a String object, not a Class object."
    elsif @@user_class.is_a?(String)
      @@user_class.constantize
    end
  end

  # Used to configure Jobbee.
  #
  # Example:
  #
  #   Jobbee.config do |config|
  #     config.site_name = "An awesome Jobbee site"
  #   end
  #
  # This method is defined within the core gem on purpose.
  # Some people may only wish to use the Core part of Jobbee.
  def self.config(&block)
    yield(Jobbee::Config)
  end
end

require 'jobbee/core/engine'

require 'jobbee/i18n'
require 'jobbee/money'
require 'jobbee/version'

require 'jobbee/core/permalinks'
require 'jobbee/core/token_resource'
require 'jobbee/core/job_duplicator'

ActiveRecord::Base.class_eval do
  include CollectiveIdea::Acts::NestedSet
end