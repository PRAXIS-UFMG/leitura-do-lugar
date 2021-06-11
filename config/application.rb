# frozen_string_literal: true

require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require 'active_job/railtie'
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require 'action_text/engine'
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LeituraDoLugar
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.i18n.default_locale = :'pt-BR'

    config.view_component.preview_controller = "ComponentPreview"
    config.view_component.default_preview_layout = "admin"

    # https://github.com/tailwindlabs/tailwindcss-jit/issues/195
    Webpacker::Compiler.env["TAILWIND_MODE"] = "build"

    # Simple reset to stop Rails from adding the #field_with_errors div
    ActionView::Base.field_error_proc = proc do |html_tag, _instance|
      html_tag.html_safe
    end
  end
end
