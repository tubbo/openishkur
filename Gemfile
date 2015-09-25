source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '~> 4.2'
gem 'neo4j'
gem 'puma'
gem 'sidekiq'
gem 'decent_exposure'
gem 'responders'
gem 'active_model_serializers'
gem 'draper'
gem 'simple_form'
gem 'devise'
gem 'devise-neo4j'
gem 'haml-rails'
gem 'pundit'
gem 'refile', require: 'refile/rails'
gem 'refile-s3'
gem 'elasticsearch-rails'

gem 'sass-rails'
gem 'coffee-rails'
gem 'foundation-rails'
gem 'uglifier',         '~> 1.3'
gem 'jquery-rails'
gem 'autoprefixer-rails'
gem 'turbolinks' #, github: 'rails/turbolinks'

#source 'https://rails-assets.org'

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
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
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
end
