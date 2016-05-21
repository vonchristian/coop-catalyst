class ShareCapital < ApplicationRecord
  belongs_to :account_owner, class_name: "User", foreign_key: 'user_id'
  has_many :capital_build_ups, as: :entriable, class_name: "Accounting::Transactions::CapitalBuildUp", foreign_key: 'entriable_id'

  validates :date_opened, :account_number, presence: true
  validates :account_number, uniqueness: true
  def balance(hash={})
      if hash[:from_date] && hash[:to_date]
        from_date = hash[:from_date].kind_of?(Date) ? hash[:from_date] : Date.parse(hash[:from_date])
        to_date = hash[:to_date].kind_of?(Date) ? hash[:to_date] : Date.parse(hash[:to_date])
        self.deposits.where(date: from_date..to_date).map{|a| a.debit_amounts.balance}.sum
      else
       self.total_deposits
      end
    end
  def deposits
    Accounting::Accounts::Equity.find_by_name!("Share Capital").entries.where(entriable: self)
  end
  def total_deposits
    self.deposits.map{|a| a.credit_amounts.balance}.sum
  end

end
