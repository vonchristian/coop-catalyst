FactoryGirl.define do
  factory :share_capital do
    account_owner  factory: :user
    account_number "MyString"
    date_opened "2016-05-08 00:15:30"
  end
end
