# frozen_string_literal: true

class Order < ActiveRecord::Base
  belongs_to :shop
end
