source 'https://rubygems.org'

gem 'rails', '~> 4.1.6'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem 'google-analytics-rails'
gem 'simple_form', '~> 3.1.0.rc1', github: 'plataformatec/simple_form'
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails',
                              github: 'anjlab/bootstrap-rails',
                              branch: '3.0.0'

gem 'angularjs-rails'
gem 'redcarpet'
gem 'marked-rails'
gem 'vuejs-rails'
gem 'brazilian-rails'

group :production do
  gem 'pg'
  gem 'rails_12factor', '0.0.2'
end

group :development do
  gem 'sqlite3'
  gem 'rubocop', require: false
  gem 'overcommit', require: false
  gem 'clean_logger'
end

group :test, :development do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'fabrication'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers'
  gem 'factory_girl', '~> 4.0'
  gem 'simplecov', require: false
  gem 'capybara'
  gem 'database_cleaner', '1.2.0'
end
