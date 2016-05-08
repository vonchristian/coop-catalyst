require 'rails_helper'

RSpec.describe ShareCapital, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :account_owner }
    it { is_expected.to have_many :capital_build_ups }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :date_opened }
    it { is_expected.to validate_presence_of :account_number }
    it { is_expected.to validate_uniqueness_of :account_number }
  end
end
