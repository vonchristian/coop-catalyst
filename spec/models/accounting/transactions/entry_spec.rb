require 'rails_helper'

RSpec.describe Accounting::Transactions::Entry, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :entriable }
    it { is_expected.to belong_to :recorder }
    it { is_expected.to have_many :credit_amounts }
    it { is_expected.to have_many :debit_amounts }
    it { is_expected.to have_many :debit_accounts }
    it { is_expected.to have_many :credit_accounts }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :description }
  end

  describe "nested_attributes" do
    it { is_expected.to accept_nested_attributes_for(:debit_amounts) }
    it { is_expected.to accept_nested_attributes_for(:credit_amounts) }
  end
end
