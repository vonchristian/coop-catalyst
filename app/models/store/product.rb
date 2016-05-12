module Store
  class Product < ApplicationRecord
    has_many :stocks
    has_many :line_items
    has_many :orders, through: :line_items
    validates :name, :description, :price, :unit, presence: true
    validates :price, numericality: { greater_than: 0.1}

    accepts_nested_attributes_for :stocks

    def quantity
      stocks.all.sum(:quantity) - line_items.all.sum(:quantity)
    end
    
    def out_of_stock?
      quantity.zero? || quantity.negative?
    end
  end
end
