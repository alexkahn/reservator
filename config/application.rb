require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Reservator
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
