module HumanResources
  class Employee < User
      belongs_to :role, foreign_key: 'role_id'
      has_many :approved_loans, class_name: "LoansSection::Approval", foreign_key: 'approver_id'
      delegate :loan_officer?, :manager?, :bookkeeper?, to: :role
      def self.matches_role(role)
        self.where(role: role)
      end
      def self.can_approve_loan?
        self.select{|a| a.loan_officer? || a.manager? }
      end

      def self.loan_officers
        self.select{|a| a.loan_officer? }
      end

      def self.managers
        self.select{|a| a.manager?}
      end

      def approved_loan(loan)
        LoansSection::Approval.where(approver_id: self.id, loan_id: loan.id).present?
      end
  end
end
