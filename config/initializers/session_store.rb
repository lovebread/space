# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dayday3_session',
  :secret      => '56ea0421a20b5a29996dff45ac535fed559a23247748a2a58bee714bb3b9782e4441c1cb9aa6dc1841afa09302365f9ab9754f7e7ce61f1e2fc19b061f28a786'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
