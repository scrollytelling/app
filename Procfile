web: bundle exec puma -C config/puma.rb
worker: bundle exec rake resque:work QUEUE=*
scheduler: bundle exec rake resque:scheduler QUEUE=*
