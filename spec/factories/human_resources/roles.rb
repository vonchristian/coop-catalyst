FactoryGirl.define do
  factory :role, class: "HumanResources::Role" do
    role "Manager"
    employee nil
  end
end
