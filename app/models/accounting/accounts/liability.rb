module Accounting
  module Accounts
    class Liability < Account
      # self.normal_credit_balance = false

      def balance(options={})
        super(options)
      end

      def self.balance(options={})
        super(options)
      end
    end
  end
end
