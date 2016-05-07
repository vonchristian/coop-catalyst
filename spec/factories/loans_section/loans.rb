FactoryGirl.define do
  factory :loan, class: "LoansSection::Loan" do
    user nil
    loan_product nil
    amount "9.99"
    date "2016-05-07 15:56:12"
    approval_status 1
  end
end
