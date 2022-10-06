source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version")

gem "rails", "7.0.4"
gem "puma"
gem "pg"
gem 'dotenv-rails', require: "dotenv/rails-now"
gem "bootsnap", require: false

gem "shakapacker"
gem "lograge"
gem "okcomputer"
gem "sentry-ruby"
gem "sentry-rails"

gem "rack-canonical-host"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Redis adapter to run Action Cable in production
# gem "redis"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development do
  gem "letter_opener"

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "simplecov", require: false
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "overcommit", require: false
end

group :development, :test do
gem "bullet"
  gem "faker"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "pry-byebug"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"

gem "lighthouse-matchers"
gem "axe-matchers"
end
gem "pundit"
gem "sidekiq"
gem "sentry-sidekiq"

# Deployment
#
# We tell bundler not to require these gems by default because the code that
# requires them will explicitly require them.
#
gem "capistrano", require: false
gem "capistrano-bundler", require: false
gem "capistrano-rails", require: false
gem "capistrano-rbenv", require: false
gem "capistrano-rake", require: false
gem "ed25519", require: false
gem "bcrypt_pbkdf", require: false


gem "devise", "~> 4.8"
