FactoryGirl.define do
  factory :account, class: "Accounting::Account" do
    code "007"
    name "Cash on Hand"
    type "Asset"
    contra false
  end
end
