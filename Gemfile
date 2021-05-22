source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'puma', '~> 5.0'
gem 'pg', '~> 1.1'

gem 'rack-cors'

gem 'jbuilder', '~> 2.7'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'factory_bot_rails'
end

group :test do
  gem 'database_cleaner-active_record'
end
