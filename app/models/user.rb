class User < ApplicationRecord
  has_one :role, class_name: "HumanResources::Role"
  has_one :occupation, class_name: "Members::Occupation"
  has_one :share_capital
  accepts_nested_attributes_for :occupation
  delegate :position, to: :occupation, allow_nil: true
  delegate :loan_officer?, :manager?, :bookkeeper?, :accounting_officer?, to: :role, allow_nil: true
  has_many :loans, class_name: "LoansSection::Loan"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :photo, styles: { medium: "295x295>",
                                             thumb: "100x100#",
                                             small: "50x50#"},
                                             default_url: ":style/profile_default.jpg"

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  validates :first_name, :middle_name, :last_name, :mobile_number, presence: true

  def self.types
    %w(Employee Member)
  end
  def to_s
    full_name
  end
  def full_name
    "#{first_name} #{middle_name.first.capitalize}. #{last_name}"
  end

end
