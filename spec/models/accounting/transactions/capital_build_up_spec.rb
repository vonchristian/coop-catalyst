require 'rails_helper'

RSpec.describe Accounting::Transactions::CapitalBuildUp, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :share_capital }
  end
end
