module Accounting
  module Transactions
    class Entry < ApplicationRecord
      validates :date, :description, presence: true
    end
  end
end
