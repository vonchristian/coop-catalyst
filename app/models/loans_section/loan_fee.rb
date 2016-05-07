module LoansSection
  class LoanFee < ApplicationRecord
    belongs_to :loan_product
    validates :rate, :name, presence: true
    validates :name, uniqueness: true
    validates :rate, numericality: { greater_than: 0.1 }
  end
end
