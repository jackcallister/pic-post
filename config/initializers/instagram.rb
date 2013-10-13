require "instagram"

# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE if Rails.env.development?

CALLBACK_URL = "http://localhost:3000/auth/instagram/callback"

Instagram.configure do |config|
  config.client_id = ENV['INSTAGRAM_ID']
  config.client_secret = ENV['INSTAGRAM_SECRET']
end
