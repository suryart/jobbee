require 'cancan'
require_dependency 'jobbee/core/controller_helpers/strong_parameters'

class Jobbee::BaseController < ApplicationController
  include Jobbee::Core::ControllerHelpers::Auth
  include Jobbee::Core::ControllerHelpers::RespondWith
  include Jobbee::Core::ControllerHelpers::SSL
  include Jobbee::Core::ControllerHelpers::Common
  include Jobbee::Core::ControllerHelpers::Search
  include Jobbee::Core::ControllerHelpers::StrongParameters

  respond_to :html
end

require 'jobbee/i18n/initializer'