source "https://rubygems.org"
# ruby '2.1.4'

#================================================== 
# RAILS CORE 
#================================================== 
gem 'rails', '4.2'
gem 'pg', '~> 0.18.1'
gem 'bundler', '>= 1.7.0'

#================================================== 
# ASSETS - Back-end 
#================================================== 
gem 'rails-i18n'
gem 'jbuilder'
gem 'simple_form'
gem 'active_decorator'
gem 'page_title'
gem 'google-analytics-rails'
gem 'kaminari'
gem 'turbolinks'

#================================================== 
# BUSINESS - Text formatters
#================================================== 
gem 'marked-rails'
gem 'redcarpet'
gem 'vuejs-rails'

#================================================== 
# ASSETS - Integration & Compressors 
#================================================== 
gem 'sass-rails'
gem 'uglifier'

#==================================================
# ASSETS - Front-end
#==================================================
source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
  gem 'rails-assets-angular'
  gem 'rails-assets-angular-resource'
  gem 'rails-assets-bootstrap-sass'
end

gem 'nprogress-rails'

#==================================================
# GEM - Development
#==================================================
group :development do
  gem 'thin'
  gem 'quiet_assets'
  gem 'pry-meta'
  gem 'overcommit', require: false
  gem 'rubocop', require: false
  gem 'sqlite3'
end

group :development, :test do
  gem 'spring'
  gem 'fabrication'
  gem 'faker'
  gem 'rspec-rails', '~> 3.2.0'
  gem 'capybara'
  gem 'database_cleaner', '1.2.0'
  gem 'factory_girl', '~> 4.0'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

#==================================================
# GEM - Production
#==================================================
group :production do
  gem 'puma'
  gem 'rails_12factor'
end