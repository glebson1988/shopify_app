# frozen_string_literal: true

class DiscountsController < ApplicationController
  def create
    shop = Shop.where(shopify_domain: params[:shop]).first

    session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    ShopifyAPI::Base.activate_session(session)

    @price_rule = ShopifyAPI::PriceRule.create(
      title: 'CrumbDiscount',
      target_type: 'line_item',
      target_selection: 'all',
      allocation_method: 'across',
      value_type: 'percentage',
      value: "-#{params[:discount_value]}",
      customer_selection: 'all',
      starts_at: Time.now.iso8601,
      usage_limit: 1
    )

    discount_code = ShopifyAPI::DiscountCode.new
    discount_code.prefix_options[:price_rule_id] = @price_rule.id
    discount_code.code = params[:discount_title]
    discount_code.save
    render json: discount_code
  end
end
