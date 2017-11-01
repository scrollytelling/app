require 'devise/async'

# We do not use Async devise because Resque is unreliable.
Devise::Async.enabled = false
