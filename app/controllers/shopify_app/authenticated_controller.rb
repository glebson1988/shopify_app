# frozen_string_literal: true

module ShopifyApp
  class AuthenticatedController < ActionController::Base
    include ShopifyApp::Authenticated

    protect_from_forgery with: :exception
    before_action :set_shop

    def set_locale
      locale = @shop.language.to_sym if @shop.present? && @shop.language.present?

      I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
    end

    private

    def set_shop
      @shop = Shop.find_by(id: session[:shop_id])
      set_locale
    end
  end
end
