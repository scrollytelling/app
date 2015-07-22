source 'https://rubygems.org'

# ruby
ruby '2.1.6'

# rails
gem 'rails', '4.1.12'

# database
gem 'mysql2'

# asset pipeline
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

# gems we need
gem 'pageflow'
gem 'activeadmin', git: 'https://github.com/codevise/active_admin.git', branch: 'rails4'
gem 'ransack'
gem 'inherited_resources', '1.4.1'
gem 'formtastic', '2.3.0'
gem 'state_machine', git: 'https://github.com/codevise/state_machine.git'
gem 'figaro'
gem 'whenever', require: false

# Pageflow page types
gem 'pageflow-before-after'

group :development do
  gem 'spring'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails'
end
