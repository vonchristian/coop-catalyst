module Accounting
  module Accounts
    class Account < ApplicationRecord
      validates :code, :name, uniqueness: true, presence: true
      validates :type, presence: true

      def self.types
        %w(Accounting::Accounts::Asset
           Accounting::Accounts::Liability
           Accounting::Accounts::Equity
           Accounting::Accounts::Revenue
           Accounting:Accounts::Expense)
      end
    end
  end
end
