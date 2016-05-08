module Accounting
  module Transactions
    class CapitalBuildUp < Entry
      belongs_to :share_capital, foreign_key: 'entriable_id'
    end
  end
end
