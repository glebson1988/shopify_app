# frozen_string_literal: true

json.array! @stored_products, partial: 'stored_products/stored_product', as: :stored_product
