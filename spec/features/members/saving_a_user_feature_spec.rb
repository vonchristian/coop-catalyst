require 'rails_helper'

feature 'Saving a user', type: :feature do
  #  before (:each) do
  #    user = FactoryGirl.create(:user)
  #    login_as(user, :scope => :user)
  #  end

  scenario 'with valid information' do
    visit users_path
    click_link "New Member"
    fill_in "First name", with: "Von Christian"
    fill_in "Middle name", with: "Pinosan"
    fill_in "Last name", with: "Halip"
    fill_in "Position",  with: "Software Developer"
    fill_in "Employer", with: "Kiphodan Technologies, Inc"
    fill_in "Address", with: "Lagawe, Ifugao"
    fill_in "Contact number", with: "00090009"
    fill_in "Email", with: "vc.halip@gmail.com"
    fill_in "Password", with: "secretpassword"
    fill_in "Password confirmation", with: "secretpassword"
    click_button "Register Member"
    expect(page).to have_content("saved successfully.")
    expect(page).to have_content("Von Christian")
  end
  end
