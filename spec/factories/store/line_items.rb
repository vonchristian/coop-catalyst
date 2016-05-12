FactoryGirl.define do
  factory :line_item, class: "Store::LineItem" do
    product nil
    cart nil
    quantity "9.99"
  end
end
