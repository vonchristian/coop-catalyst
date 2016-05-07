require 'rails_helper'

RSpec.describe LoansSection::InterestRate, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :loan_product }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of :rate }
    it { is_expected.to validate_numericality_of :rate }
  end

  describe "enum for recurrence" do
    it do
      should define_enum_for(:recurrence).with([:monthly, :annually])
    end
  end
end
