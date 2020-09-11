# frozen_string_literal: true

class CreateProductImages < ActiveRecord::Migration[6.0]
  def change
    create_table :product_images do |t|
      t.string :image_url
      t.bigint :shopify_id
      t.references :stored_product, foreign_key: true

      t.timestamps
    end
  end
end
