FactoryGirl.define do
  factory :interest_rate, class: "LoansSection::InterestRate" do
    loan_product nil
    rate "9.99"
    recurrence 1
  end
end
