module Store
  class Product < ApplicationRecord
    has_many :stocks, class_name: "Store::Stock"
    validates :name, :description, :price, :unit, presence: true
    validates :price, numericality: { greater_than: 0.1}

    accepts_nested_attributes_for :stocks
  end
end
