# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_theorangeseed_session',
  :secret      => '6fa1d5edc0c5e69b2035cd779ae8589e777e92c0dc3cb06929d227c921fef7673e6507a4afbf39ecc96e3d92ccff0882043e283b02cfbf334ec67ee1207ca797'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
