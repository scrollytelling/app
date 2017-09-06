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
gem 'pageflow', '~> 12.0.1'
gem 'state_machine', git: 'https://github.com/codevise/state_machine.git'
gem 'rack-attack'
gem 'figaro'
gem 'whenever', require: false
gem "sentry-raven"
gem "snitcher"
gem "okcomputer"

# We extend Devise to increase securitay.
gem 'devise_zxcvbn'
gem 'devise-uncommon_password'

# Pageflow extensions
gem 'pageflow-internal-links'
gem 'pageflow-external-links'
gem 'pageflow-linkmap-page'
gem 'pageflow-text-page'
gem 'pageflow-embedded-video'
gem 'pageflow-before-after'
gem 'pageflow-chart'
# gem 'pageflow-oembed'

# Scrollytelling
gem 'scrollytelling-navigation'
gem 'scrollytelling-loading_spinner'

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
