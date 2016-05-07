FactoryGirl.define do
  factory :user do
    first_name "Von Christian"
    middle_name "Pinosan"
    last_name "Halip"
    sequence(:email) { |n| "100#{n}#{n}@coop_catalyst.com" }
    password 'secretpassword'
    password_confirmation 'secretpassword'
  end
end
