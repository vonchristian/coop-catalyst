require 'rails_helper'

RSpec.describe HumanResources::Role, :type => :model do
  describe "association" do
    it { is_expected.to belong_to :employee }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :role }
    it { is_expected.to validate_uniqueness_of :role }

  end

  it ".to_s" do
    role = build(:role, role: "Loan Officer")
    expect(role.to_s).to eql("Loan Officer")
  end
  it ".manager?" do
    role = build(:role, role: "Manager")

    expect(role.manager?).to be(true)
  end

  it ".loan_officer?" do
    role = build(:role, role: "Loan Officer")

    expect(role.loan_officer?).to be(true)
  end

  it ".bookkeeper?" do
    role = build(:role, role: "Bookkeeper")

    expect(role.bookkeeper?).to be(true)
  end
end
