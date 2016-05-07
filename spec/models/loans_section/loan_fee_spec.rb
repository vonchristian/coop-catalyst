require 'rails_helper'

RSpec.describe LoansSection::LoanFee, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :loan_product }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of :rate }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it do
      is_expected.to validate_numericality_of(:rate).is_greater_than(0.1)
    end

  end
end
