# frozen_string_literal: true

ShopifyApp.configure do |config|
  config.application_name = 'demo_app'
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_API_SECRET']
  config.old_secret = ''
  config.scope = 'read_products,
                  read_orders,
                  write_orders,
                  write_products,
                  read_script_tags,
                  write_script_tags'
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = '2020-07'
  config.shop_session_repository = 'Shop'
  config.user_session_repository = 'User'
  config.allow_jwt_authentication = true
end
