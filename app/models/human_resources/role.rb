module HumanResources
  class Role < ApplicationRecord
    belongs_to :employee, class_name: "HumanResources::Employee", foreign_key: 'user_id'
    validates :role, presence: true, uniqueness: true
    def to_s
      role
    end

    def manager?
      role == "Manager"
    end

    def loan_officer?
      role == "Loan Officer"
    end

    def accounting_officer?
      role == "Accounting Officer" || role == "Bookkeeper"
    end

    def bookkeeper?
      role == "Bookkeeper"
    end
  end
end
