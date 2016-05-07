require 'rails_helper'

RSpec.describe Accounting::Accounts::Account, :type => :model do
  describe "associations" do
    it { is_expected.to have_many :debit_amounts }
    it { is_expected.to have_many :credit_amounts }
    it { is_expected.to have_many :debit_entries }
    it { is_expected.to have_many :credit_entries }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of :type }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_uniqueness_of :code }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
