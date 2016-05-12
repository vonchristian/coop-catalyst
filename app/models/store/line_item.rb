module Store
  class LineItem < ApplicationRecord
    belongs_to :product
    belongs_to :cart
    belongs_to :order
    # validates :quantity, numericality: {less_than_or_equal_to: :remaining_product_quantity }
    def total_price
      product.price * quantity
    end
    
    def self.total_price
        self.all.to_a.sum { |item| item.total_price }
    end

    def remaining_product_quantity
      product.quantity
    end
  end
end
