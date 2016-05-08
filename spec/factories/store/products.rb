FactoryGirl.define do
  factory :product, class: "Store::Product" do
    name "MyString"
    description "MyString"
    price "9.99"
  end
end
