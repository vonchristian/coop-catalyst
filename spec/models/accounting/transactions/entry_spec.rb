require 'rails_helper'

RSpec.describe Accounting::Transactions::Entry, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :entriable }
    it { is_expected.to belong_to :recorder }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :description }
  end
end
