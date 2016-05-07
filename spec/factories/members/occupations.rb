FactoryGirl.define do
  factory :occupation, class: "Members::Occupation" do
    position "Software Developer"
    employer "Kiphodan Technologies, Inc."
    employer_address "Lagawe, Ifugao"
    contact_number "000-000-0000"
    user nil
  end
end
