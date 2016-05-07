module Accounting
  module Transactions
    class Entry < ApplicationRecord
      belongs_to :entriable, polymorphic: true
      belongs_to :recorder, class_name: "User", foreign_key: 'recorder_id'
      validates :date, :description, presence: true
    end
  end
end
