# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  end

  def show
    @product = ShopifyAPI::Product.find(params[:id])
    @product_metafields = []
    shopify_session = ShopifyAPI::Session.new(domain: 'gleb-test-store.myshopify.com',
                                              api_version: '2020-07',
                                              token: Shop.first.shopify_token)
    ShopifyAPI::Base.activate_session(shopify_session)
    headers = { 'X-Shopify-Access-Token' => shopify_session.token }
    metafields = HTTParty
                 .get('https://gleb-test-store.myshopify.com/admin/products/' + @product.id.to_s + '/metafields.json',
                      headers: headers).values
    @product_metafields.push(metafields)
  end

  def edit; end
end
