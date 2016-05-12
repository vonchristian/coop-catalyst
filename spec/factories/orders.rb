FactoryGirl.define do
  factory :order do
    customer_id 1
    customer_type "MyString"
    name "MyString"
    address "MyString"
    mobile_number "MyString"
    email "MyString"
    payment_type 1
  end
end
