class ShareCapital < ApplicationRecord
  belongs_to :account_owner, class_name: "User", foreign_key: 'user_id'
  has_many :capital_build_ups, as: :entriable, class_name: "Accounting::Transactions::CapitalBuildUp", foreign_key: 'entriable_id'

  validates :date_opened, :account_number, presence: true
  validates :account_number, uniqueness: true
end
