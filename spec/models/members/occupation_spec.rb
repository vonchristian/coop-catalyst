require 'rails_helper'

RSpec.describe Members::Occupation, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :user }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :position }
    it { is_expected.to validate_presence_of :employer }
    it { is_expected.to validate_presence_of :employer_address }
    it { is_expected.to validate_presence_of :contact_number }
  end
end
