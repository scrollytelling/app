Raven.configure do |config|
  config.async = lambda { |event|
    SentryJob.perform_later(event.to_hash)
  }
end
