require 'rails_helper'

RSpec.describe LoansSection::LoanProduct, :type => :model do
  describe "associations" do
    it { is_expected.to have_one :interest_rate }
    it { is_expected.to have_many :fees }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :term }
    it { is_expected.to validate_numericality_of :term }
  end

  describe "nested_attributes" do
    it { is_expected.to accept_nested_attributes_for(:interest_rate) }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:rate).to(:interest_rate)}
  end
end
