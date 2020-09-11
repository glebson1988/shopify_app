# frozen_string_literal: true

require 'test_helper'

class Api::V1::StoredProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stored_product = stored_products(:one)
  end

  test 'should get index' do
    get api_v1_stored_products_url
    assert_response :success
  end

  test 'should get new' do
    get new_api_v1_stored_product_url
    assert_response :success
  end

  test 'should create stored_product' do
    assert_difference('StoredProduct.count') do
      post api_v1_stored_products_url, params: { stored_product: {} }
    end

    assert_redirected_to stored_product_url(StoredProduct.last)
  end

  test 'should show stored_product' do
    get api_v1_stored_product_url(@stored_product)
    assert_response :success
  end

  test 'should get edit' do
    get edit_api_v1_stored_product_url(@stored_product)
    assert_response :success
  end

  test 'should update stored_product' do
    patch api_v1_stored_product_url(@stored_product), params: { stored_product: {} }
    assert_redirected_to stored_product_url(@stored_product)
  end

  test 'should destroy stored_product' do
    assert_difference('StoredProduct.count', -1) do
      delete api_v1_stored_product_url(@stored_product)
    end

    assert_redirected_to api_v1_stored_products_url
  end
end
