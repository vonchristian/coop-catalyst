module LoansSection
  class Approval < ApplicationRecord
    belongs_to :loan
    belongs_to :approver, class_name: "User", foreign_key: "approver_id"

    validates :date, presence: true
  end
end
