# frozen_string_literal: true

require 'application_system_test_case'

class StoredProductsTest < ApplicationSystemTestCase
  setup do
    @stored_product = stored_products(:one)
  end

  test 'visiting the index' do
    visit stored_products_url
    assert_selector 'h1', text: 'Stored Products'
  end

  test 'creating a Stored product' do
    visit stored_products_url
    click_on 'New Stored Product'

    click_on 'Create Stored product'

    assert_text 'Stored product was successfully created'
    click_on 'Back'
  end

  test 'updating a Stored product' do
    visit stored_products_url
    click_on 'Edit', match: :first

    click_on 'Update Stored product'

    assert_text 'Stored product was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Stored product' do
    visit stored_products_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Stored product was successfully destroyed'
  end
end
