# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#TuSocial::Application.config.secret_key_base = 'ef943ed5804ad3fd9e64669385b1162d28e2ae958242de6a676a78fc8a0eb9f026d340e25bb68a70dac2c58cf03cae5b0253a1a5a8d83e1597339753e54f7a96'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

TuSocial::Application.config.secret_key_base = secure_token
