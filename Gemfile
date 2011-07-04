source 'http://rubygems.org'

gem 'rails', '3.1.0.rc4'
gem 'client_side_validations', '3.1.0'
gem 'kaminari'
gem 'sass'
gem 'haml-rails'
gem 'devise'
gem 'paperclip'
gem 'acts-as-taggable-on'
gem 'mime-types', :require => 'mime/types'
gem "compass", ">= 0.10.6"
gem 'tabs_on_rails'
gem 'jquery-rails'
gem 'acl9'
gem 'capistrano'
gem 'clovercms-dashboard', :require => 'dashboard'

#asset pipeline
gem 'json'
gem 'sass'
gem 'coffee-script'
gem 'uglifier'

group :development do
  gem 'metric_fu', :require => false
end

group :test do
  gem 'factory_girl_rails'
  gem 'mocha', :require => false
  gem 'capybara'
  gem 'turn'
end

platforms :ruby do
  group :test, :development do
    gem 'sqlite3-ruby', :require => 'sqlite3'
  end

  group :production do
    gem 'mysql2', "0.3.2"
  end
end

platforms :jruby do
  gem 'activerecord-jdbc-adapter'
  gem 'jruby-openssl'
  gem 'trinidad'
  gem 'ffi-ncurses'

  group :test, :development do
    gem 'jdbc-sqlite3'
  end

  group :production do
    gem 'jdbc-mysql', :require => false
  end
end
