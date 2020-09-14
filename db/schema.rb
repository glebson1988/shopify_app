# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_914_072_431) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'blocks', force: :cascade do |t|
    t.string 'block_id'
    t.string 'block_type'
    t.text 'block_text'
    t.string 'image_url'
    t.text 'lookbook_html'
    t.bigint 'stored_product_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['stored_product_id'], name: 'index_blocks_on_stored_product_id'
  end

  create_table 'product_images', force: :cascade do |t|
    t.string 'image_url'
    t.bigint 'shopify_id'
    t.bigint 'stored_product_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['stored_product_id'], name: 'index_product_images_on_stored_product_id'
  end

  create_table 'shops', force: :cascade do |t|
    t.string 'shopify_domain', null: false
    t.string 'shopify_token', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'language', default: 'en'
    t.index ['shopify_domain'], name: 'index_shops_on_shopify_domain', unique: true
  end

  create_table 'stored_products', force: :cascade do |t|
    t.bigint 'shopify_id'
    t.string 'shopify_title'
    t.string 'shopify_image_url'
    t.string 'shopify_handle'
    t.bigint 'shop_id'
    t.text 'lookbook_html'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['shop_id'], name: 'index_stored_products_on_shop_id'
  end

  create_table 'users', force: :cascade do |t|
    t.bigint 'shopify_user_id', null: false
    t.string 'shopify_domain', null: false
    t.string 'shopify_token', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['shopify_user_id'], name: 'index_users_on_shopify_user_id', unique: true
  end

  add_foreign_key 'blocks', 'stored_products'
  add_foreign_key 'product_images', 'stored_products'
  add_foreign_key 'stored_products', 'shops'
end
