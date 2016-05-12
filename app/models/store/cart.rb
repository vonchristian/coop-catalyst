module Store
  class Cart < ApplicationRecord
    has_many :line_items

    def total_price
      line_items.to_a.sum { |item| item.total_price }
    end

    def add_product
      sums = self.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          # remove individual items
          self.line_items.where(product_id: product_id).delete_all
          # replace with a single item
          self.line_items.create(product_id: product_id, quantity: quantity)
        end
      end
    end
  end
end
