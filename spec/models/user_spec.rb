require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "associations" do
    it { is_expected.to have_one :share_capital }
    it { is_expected.to have_many :loans }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :middle_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_confirmation_of :password}
  end
  it "#full_name" do
    user = build(:user, first_name: "Von Christian", middle_name: "Pinosan", last_name: "Halip")

    expect(user.full_name).to eql "Von Christian P. Halip"
  end
  it ".to_s" do
    user = build(:user, first_name: "Von Christian", middle_name: "Pinosan", last_name: "Halip")
    expect(user.to_s).to eql "Von Christian P. Halip"
  end
end
