source 'https://rubygems.org'

# ruby
ruby '2.3.4'

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
gem 'pageflow', '~> 12.0.0.rc4', github: 'scrollytelling/pageflow', branch: '12-0-stable'
gem 'state_machine', git: 'https://github.com/codevise/state_machine.git'
gem 'figaro'
gem 'whenever', require: false
gem "sentry-raven"
gem "snitcher"
gem "okcomputer"

# Pageflow extensions
# grab prereleases from github since compat with 12 isn't published yet
gem 'pageflow-internal-links', github: 'codevise/pageflow-internal-links' # need 0.3.0
gem 'pageflow-linkmap-page', github: 'codevise/pageflow-linkmap-page' # need 0.3.0
gem 'pageflow-external-links', github: 'codevise/pageflow-external-links' # need 0.5.0
gem 'pageflow-text-page', github: 'codevise/pageflow-text-page' # need 0.4.0
gem 'pageflow-embedded-video', github: 'codevise/pageflow-embedded-video' # need 0.4.0
gem 'pageflow-before-after', github: 'codevise/pageflow-before-after' # need 0.6.0

# Scrollytelling
gem 'scrollytelling-loading_spinner'
gem 'scrollytelling-pageflow-navigation'

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
