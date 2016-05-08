module Store
  class Stock < ApplicationRecord
    belongs_to :product
    validates :quantity, :date, presence: true
    validates :quantity, numericality: { greater_than: 0.1 }
  end
end
