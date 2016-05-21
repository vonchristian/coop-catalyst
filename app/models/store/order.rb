module Store
  class Order < ApplicationRecord
    belongs_to :customer, polymorphic: true
    has_many :line_items
    enum payment_type: [:cash, :check, :credit_card]

    def self.customer_types
      ["Member", "Guest"]
    end
    def add_line_items_from_cart(cart)
      cart.line_items.each do |item|
        item.cart_id = nil
        line_items << item
      end
    end
  end
end
