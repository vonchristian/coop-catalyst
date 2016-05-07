module LoansSection
  class Loan < ApplicationRecord
    belongs_to :member, class_name: "User", foreign_key: 'user_id'
    belongs_to :loan_product, class_name: "LoansSection::LoanProduct"
    enum approval_status:[:pending, :approved, :disapproved]

    validates :amount, :loan_product_id, :date, presence: true
    validates :amount, numericality: true
  end
end
