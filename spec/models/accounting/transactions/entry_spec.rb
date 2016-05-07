require 'rails_helper'

RSpec.describe Accounting::Transactions::Entry, :type => :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :description }
  end
end
