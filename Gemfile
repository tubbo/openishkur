source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '~> 4.2'
gem 'neo4j'
gem 'puma'
gem 'decent_exposure'
gem 'responders'
gem 'draper'
gem 'simple_form'
gem 'devise'
gem 'devise-neo4j'
gem 'haml-rails'
gem 'pundit'
gem 'refile', require: 'refile/rails'
gem 'elasticsearch-rails'
gem 'elasticsearch-model'
gem 'nested_form'

gem 'sass-rails'
gem 'coffee-rails'
gem 'foundation-rails'
gem 'uglifier',         '~> 1.3'
gem 'jquery-rails'
gem 'autoprefixer-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'lodash-rails'
gem 'jquery-tokeninput-rails'
gem 'font-awesome-sass'

source 'https://rails-assets.org' do
  gem 'rails-assets-vis'
end

group :development do
  gem 'meta_request'
  gem 'quiet_assets'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-sidekiq'
  gem 'guard-rails'
  gem 'guard-livereload'
  gem 'guard-bundler'
  gem 'guard-spring'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rubocop'
  gem 'yard'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :production do
  gem 'rack-cache'
  gem 'redis-rails'
  gem 'asset_sync'
  gem 'refile-s3'
  gem 'sidekiq'
end
