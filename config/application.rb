require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Storyboard
  class Application < Rails::Application
    # required for i18n-js gem
    config.assets.initialize_on_precompile = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Amsterdam'

    # I found that in applications which explicitly change the I18n.load_path
    # in their application.rb app paths actually come last and thus can override translations:
    # https://github.com/codevise/pageflow/issues/496
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # insert Rack::Attack before the params parser so we can block alihack et al.
    # https://github.com/kickstarter/rack-attack/issues/99
    config.middleware.insert_before ActionDispatch::ParamsParser, Rack::Attack
  end
end
