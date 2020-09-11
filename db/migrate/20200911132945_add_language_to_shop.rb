# frozen_string_literal: true

class AddLanguageToShop < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :language, :string, default: 'en'
  end
end
