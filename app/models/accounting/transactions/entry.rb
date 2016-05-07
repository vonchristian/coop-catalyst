module Accounting
  module Transactions
    class Entry < ApplicationRecord
      belongs_to :entriable, polymorphic: true
      belongs_to :recorder, class_name: "User", foreign_key: 'recorder_id'

      has_many :credit_amounts, :extend => Accounting::AmountsExtension, :class_name => 'Accounting::CreditAmount', :inverse_of => :entry, dependent: :destroy
      has_many :debit_amounts, :extend => Accounting::AmountsExtension, :class_name => 'Accounting::DebitAmount', :inverse_of => :entry, dependent: :destroy
      has_many :credit_accounts, :through => :credit_amounts, :source => :account, :class_name => 'Accounting::Accounts::Account', dependent: :destroy
      has_many :debit_accounts, :through => :debit_amounts, :source => :account, :class_name => 'Accounting::Accounts::Account', dependent: :destroy

      validates :date, :description, presence: true
      validate :has_credit_amounts?
      validate :has_debit_amounts?
      validate :amounts_cancel?
      accepts_nested_attributes_for :debit_amounts, :credit_amounts

      private
      def has_credit_amounts?
        errors[:base] << "Entry must have at least one credit amount" if self.credit_amounts.blank?
      end

      def has_debit_amounts?
        errors[:base] << "Entry must have at least one debit amount" if self.debit_amounts.blank?
      end

      def amounts_cancel?
        errors[:base] << "The credit and debit amounts are not equal" if credit_amounts.balance_for_new_record != debit_amounts.balance_for_new_record
      end
    end
  end
end
