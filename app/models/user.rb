# frozen_string_literal: true

class User < ActiveRecord::Base
  include ShopifyApp::UserSessionStorage

  def api_version
    ShopifyApp.configuration.api_version
  end
end
