FactoryGirl.define do
  factory :entry, class: "Accounting::Transactions::Entry" do
    reference_number "MyString"
    date "2016-05-07 08:32:01"
    entriable_id 1
    entriable_type "MyString"
    description "MyString"
    recorder_id 1
  end
end
