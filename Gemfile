source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'rails', '~> 7.0.4'

gem 'bootsnap', require: false
gem 'carrierwave'
gem 'zipruby'

gem 'devise'
gem 'devise-jwt'

gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'pry-rails'
gem 'rack-cors'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda-matchers'

  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'rexml'
  gem 'rubycritic', require: false

  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-performance', require: false
end
