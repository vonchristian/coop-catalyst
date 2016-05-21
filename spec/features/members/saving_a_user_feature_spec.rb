require 'rails_helper'

feature 'Saving a user', type: :feature do
   before (:each) do
     user = FactoryGirl.create(:user)
     login_as(user, :scope => :user)
   end

  scenario 'with valid information' do
    visit users_path
    click_link "New Member"
    fill_in "First Name", with: "Von Christian"
    fill_in "Middle Name", with: "Pinosan"
    fill_in "Last Name", with: "Halip"
    fill_in "Email", with: "vc.halip@gmail.com"
    fill_in "Contact Number", with: "909809809"
    fill_in "Position",  with: "Software Developer"
    fill_in "user_occupation_attributes_employer", with: "Kiphodan Technologies, Inc"
    fill_in "user_occupation_attributes_employer_address", with: "Lagawe, Ifugao"
    fill_in "user_occupation_attributes_contact_number", with: "00090009"
    fill_in "Password", with: "secretpassword"
    fill_in "Password confirmation", with: "secretpassword"
    click_button "Register Member"
    expect(page).to have_content("saved successfully.")
    expect(page).to have_content("Von Christian")
  end
  end
