web:     bundle exec puma -C config/puma.rb
release: bundle exec rake db:migrate db:seed
worker:  bundle exec sidekiq -C config/sidekiq.yml