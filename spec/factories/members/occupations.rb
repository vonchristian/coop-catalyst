FactoryGirl.define do
  factory :occupation, class: "Members::Occupation" do
    position "MyString"
    employer "MyString"
    employer_address "MyString"
    contact_number "MyString"
    user nil
  end
end
