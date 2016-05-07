require 'rails_helper'

RSpec.describe LoansSection::Loan, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :loan_product }
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :approvals }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_presence_of :loan_product_id }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_numericality_of :amount }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:name).to(:loan_product).with_prefix }
  end

  describe "enum for payment status" do
    it do
      should define_enum_for(:approval_status).with([:pending, :approved, :disapproved])
    end
  end
end
