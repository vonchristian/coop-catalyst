FactoryGirl.define do
  factory :approval, class: "LoansSection::Approval" do
    loan nil
    approver_id 1
  end
end
