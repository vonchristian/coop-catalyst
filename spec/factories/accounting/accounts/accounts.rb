FactoryGirl.define do
  factory :account, class: "Accounting::Accounts::Account" do
    sequence(:code) { |n| "100#{n}#{n}" }
    sequence(:name) { |n| "#{n}account#{n}" }
    type "Asset"
    contra false
  end
end
