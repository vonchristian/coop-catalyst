require 'rails_helper'

feature 'Registering a new employee', type: :feature do
   before (:each) do
     user = FactoryGirl.create(:user)
     login_as(user, :scope => :user)
   end
given! (:role) { create(:role, role: "Loan Officer")}
  scenario 'with valid information' do
    visit human_resources_employees_path
    click_link "New Employee"
    fill_in "First name", with: "Von Christian"
    fill_in "Middle name", with: "Pinosan"
    fill_in "Last name", with: "Halip"
    choose "Loan Officer"
    fill_in "Email", with: "vc.halip@gmail.com"
    fill_in "Password", with: "secretpassword"
    fill_in "Password confirmation", with: "secretpassword"
    click_button "Register Employee"
    expect(page).to have_content("registered successfully.")
    expect(page).to have_content("Von Christian")
  end
  end
