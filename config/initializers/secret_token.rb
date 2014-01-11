# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Moneyable::Application.config.secret_key_base = ENV['SECRET_KEY_BASE'] || "75ea41318e09c34e05a2b8ff0e411fa1c5a151f71492e6382dfb1e96e39e86a34fb54968baab21d6cd64cb2c41e2a5efe750d7caf13a769bf0e1d07a3ac79ca6"
