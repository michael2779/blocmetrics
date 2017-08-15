require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blocmetrics
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil
    ActionMailer::Base.smtp_settings = {
     :address  => 'smtp.mailgun.org',
     :domain   => 'sandboxbb675c83a8794d8e948e9fb8dada7de2.mailgun.org',
     :port     => 587,
     :user_name  => ENV['MAILGUN_USERNAME'],
     :password => ENV['MAILGUN_PASSWORD'],
     :authentication => ':plain',
   }
  end
end