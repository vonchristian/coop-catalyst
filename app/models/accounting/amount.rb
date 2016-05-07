module Accounting
  class Amount < ApplicationRecord
    belongs_to :account, class_name: "Accounting::Accounts::Account"
    belongs_to :entry, class_name: "Accounting::Transactions::Entry"

    validates_presence_of :type, :amount, :entry, :account

    def account_name=(name)
      self.account = Accounting::Accounts::Account.find_by_name(name)
    end

    protected
    # Support constructing amounts with account = "name" syntax
    def account_with_name_lookup=(name)
      if name.kind_of?(String)
        ActiveSupport::Deprecation.warn('Account was given an :account String (use account_name instead)', caller)
        self.account_name = name
      else
        self.account_without_name_lookup = name
      end
    end
    alias_method_chain :account=, :name_lookup
  end
end
