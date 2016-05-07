module LoansSection
  class Loan < ApplicationRecord
    belongs_to :user
    belongs_to :loan_product, class_name: "LoansSection::LoanProduct"
    has_many :approvals, class_name: "LoansSection::Approval"
    enum approval_status:[:pending, :approved, :disapproved]

    validates :amount, :loan_product_id, :date, presence: true
    validates :amount, numericality: true

    delegate :name, to: :loan_product, prefix: true
  end
end
