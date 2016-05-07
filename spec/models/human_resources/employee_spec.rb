require 'rails_helper'

RSpec.describe HumanResources::Employee, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :role }
    it { is_expected.to have_many :approved_loans }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:loan_officer?).to(:role)}
    it { is_expected.to delegate_method(:manager?).to(:role)}
    it { is_expected.to delegate_method(:bookkeeper?).to(:role)}
  end

  it ".matches_role" do
    role = create(:role, role: "Loan Officer")
    role2 = create(:role, role: "Manager")
    employee1 = create(:employee, role: role )
    employee2 = create(:employee, role: role2 )

    expect(HumanResources::Employee.all.matches_role(role)).to include(employee1)
    expect(HumanResources::Employee.all.matches_role(role)).to_not  include(employee2)
  end

  it ".can_approve_loan?" do
    role = create(:role, role: "Loan Officer")
    role2 = create(:role, role: "Manager")
    role3 = create(:role, role: "Guest")
    employee1 = create(:employee, role: role )
    employee2 = create(:employee, role: role2 )
    employee3 = create(:employee, role: role3 )

    expect(HumanResources::Employee.can_approve_loan?).to include(employee1, employee2)
    expect(HumanResources::Employee.can_approve_loan?).to_not  include(employee3)
  end

  it ".loan_officers" do
    role = create(:role, role: "Loan Officer")
    role2 = create(:role, role: "Manager")
    employee1 = create(:employee, role: role )
    employee2 = create(:employee, role: role2 )

    expect(HumanResources::Employee.loan_officers).to include(employee1)
    expect(HumanResources::Employee.loan_officers).to_not include(employee2)
  end

  it ".managers" do
    role = create(:role, role: "Loan Officer")
    role2 = create(:role, role: "Manager")
    employee1 = create(:employee, role: role )
    employee2 = create(:employee, role: role2 )

    expect(HumanResources::Employee.managers).to_not include(employee1)
    expect(HumanResources::Employee.managers).to include(employee2)
  end
end
