require 'rails_helper'

feature 'Editing an employee', type: :feature do
   before (:each) do
     user = FactoryGirl.create(:user)
     login_as(user, :scope => :user)
   end
  given! (:role) { create(:role)}
  given! (:employee) { create(:employee, role: role)}
  scenario 'with valid information' do
    visit human_resources_employee_path(employee)
    click_link "Update"
    fill_in "First name", with: "Von Christian"
    fill_in "Middle name", with: "Pinosan"
    fill_in "Last name", with: "Halip"
    fill_in "Email", with: "vc.halip@gmail.com"
    fill_in "Password", with: "secretpassword"
    fill_in "Password confirmation", with: "secretpassword"
    click_button "Update Employee"
    expect(page).to have_content("updated successfully.")
    expect(page).to have_content("Von Christian")
  end
  end
