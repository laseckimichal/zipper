require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "active_storage/engine"
require "action_mailer/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module Zipper
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true

    config.active_record.time_zone_aware_types = %i[datetime time]
    config.time_zone = 'Warsaw'
  end
end
