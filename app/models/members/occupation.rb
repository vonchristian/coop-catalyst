module Members
  class Occupation < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    validates :position, :employer, :employer_address, :contact_number, presence: true
  end
end
