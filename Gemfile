source 'https://rubygems.org'

# ruby
ruby '2.1.6'

# rails
gem 'rails', '4.2.7.1'

# database
gem 'mysql2'
gem "redis-rails"

# asset pipeline
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'

# gems we need
gem 'pageflow', '0.11.1'
gem 'state_machine', git: 'https://github.com/codevise/state_machine.git'
gem 'figaro'
gem 'whenever', require: false
gem "sentry-raven"
gem "snitcher"

# Pageflow extensions
gem 'pageflow-internal-links'
gem 'pageflow-external-links'
gem 'pageflow-before-after'
gem 'pageflow-text-page'
gem 'pageflow-embedded-video'
gem 'pageflow-linkmap-page', path: '/Users/joost/Gems/pageflow-linkmap-page'
gem 'scrollytelling-loading_spinner'
gem 'scrollytelling-pageflow-navigation'

group :development do
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails'
end
