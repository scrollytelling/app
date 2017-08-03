source 'https://rubygems.org'

# ruby
ruby '2.3.4'

# rails
gem 'rails', '4.2.9'

# database
gem 'mysql2'
gem "redis-rails"

# asset pipeline
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'

# gems we need
gem 'pageflow', github: 'scrollytelling/pageflow', branch: '0-11-atmo-initializer'
gem 'state_machine', git: 'https://github.com/codevise/state_machine.git'
gem 'rack-attack'
gem 'figaro'
gem 'whenever', require: false
gem "sentry-raven"
gem "snitcher"
gem "okcomputer"

# Pageflow extensions
gem 'pageflow-internal-links'
gem 'pageflow-external-links'
gem 'pageflow-before-after'
gem 'pageflow-text-page'
gem 'pageflow-embedded-video'
gem 'pageflow-linkmap-page', github: 'scrollytelling/pageflow-linkmap-page', branch: 'scrollytelling-rendered-text'
gem 'pageflow-chart'
gem 'scrollytelling-loading_spinner'
gem 'scrollytelling-pageflow-navigation'
gem 'pageflow-oembed'

group :development do
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'poltergeist'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
