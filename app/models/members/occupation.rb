module Members
  class Occupation < ApplicationRecord
    belongs_to :user
    validates :position, :employer, :employer_address, :contact_number, presence: true
  end
end
