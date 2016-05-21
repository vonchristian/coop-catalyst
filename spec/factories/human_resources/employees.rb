FactoryGirl.define do
  factory :employee, class: "HumanResources::Employee" do
    first_name "Von Christian"
    middle_name "Pinosan"
    last_name "Halip"
    sequence(:email) { |n| "100#{n}#{n}@coop_catalyst.com" }
    mobile_number "0921234422333"
    password 'secretpassword'
    password_confirmation 'secretpassword'
  end
end
