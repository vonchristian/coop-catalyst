require 'rails_helper'

RSpec.describe Accounting::Account, :type => :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :type }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_uniqueness_of :code }
    it { is_expected.to validate_uniqueness_of :name }

  end
end
