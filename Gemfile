source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'
gem 'bcrypt',         '3.1.13'
gem 'bootstrap-sass', '3.4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'omniauth'
gem 'omniauth-facebook'
gem 'devise'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'dotenv-rails'
gem 'mini_magick'
gem 'faker'
gem 'active_storage_validations'
gem 'image_processing'                     
gem 'ransack'

group :development, :test do
  gem 'rspec-rails', '~> 4.0.1'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 4.11'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest',                 '5.14.2'
  gem 'minitest-reporters',       '1.3.8'
  gem 'guard',                    '2.16.2'
  gem 'guard-minitest',           '2.4.6'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
