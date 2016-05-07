FactoryGirl.define do
  factory :loan_product, class: "LoansSection::LoanProduct" do
    name "Salary Loan"
    term "12"
    status 1
  end
end
