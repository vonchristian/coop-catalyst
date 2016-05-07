module Accounting
  class Account < ApplicationRecord
    validates :code, :name, uniqueness: true, presence: true
    validates_presence_of :type
    def self.types
      %w(Accounting::Asset Liability Equity Revenue Expense)
    end
  end
end
