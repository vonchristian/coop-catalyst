module LoansSection
  class InterestRate < ApplicationRecord
    enum recurrence: [:monthly, :annually]
    belongs_to :loan_product, class_name: "LoansSection::LoanProduct"

    validates :rate, presence: true, numericality: true

  end
end
