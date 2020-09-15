# frozen_string_literal: true

require 'test_helper'

class Api::V1::FrontEndControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_v1_front_end_index_url
    assert_response :success
  end
end
