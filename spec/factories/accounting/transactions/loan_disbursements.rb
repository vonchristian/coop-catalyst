FactoryGirl.define do
  factory :loan_disbursement, class: "Accounting::Transactions::LoanDisbursement" do
    reference_number "MyString"
    date "2016-05-07 08:32:01"
    entriable_id 1
    entriable_type "MyString"
    description "MyString"
    recorder_id 1
  end
end
