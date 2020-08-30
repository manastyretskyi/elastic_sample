source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker'
gem 'jbuilder', '~> 2.7'
gem "react_on_rails"
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
gem 'csv', require: false
# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails', branch: 'master'
gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails', branch: 'master'
gem 'elasticsearch-persistence', github: 'elastic/elasticsearch-rails', branch: 'master'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker', github: 'faker-ruby/faker', branch: 'master'
  gem 'rspec-rails'
  gem 'elasticsearch-extensions', github: 'elasticsearch/elasticsearch-ruby', branch: 'master'
end

group :test do
  gem 'database_cleaner-active_record'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'mini_racer', platforms: :ruby