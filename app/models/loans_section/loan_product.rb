module LoansSection
  class LoanProduct < ApplicationRecord
    has_one :interest_rate, class_name: "LoansSection::InterestRate"
    has_many :fees, class_name: "LoansSection::LoanFee"
    belongs_to :loan, class_name: "LoansSection::Loan"
    validates :name, :term, presence: true
    validates :name, uniqueness: true
    validates :term, numericality: true
    accepts_nested_attributes_for :interest_rate
  end
end
