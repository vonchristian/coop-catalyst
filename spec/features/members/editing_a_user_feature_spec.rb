require 'rails_helper'

feature 'Editing a user', type: :feature do
   before (:each) do
     user = FactoryGirl.create(:user)
     login_as(user, :scope => :user)
   end
  given! (:user) { create(:user)}
  given! (:occupation) { create(:occupation, user: user)}
  scenario 'with valid information' do
    visit user_path(user)
    click_link "Update"
    fill_in "First Name", with: "Von Christian"
    fill_in "Middle Name", with: "Pinosan"
    fill_in "Last Name", with: "Halip"
    fill_in "Email", with: "vc.halip@gmail.com"
    fill_in "Password", with: "secretpassword"
    fill_in "Password confirmation", with: "secretpassword"
    click_button "Update Member"
    expect(page).to have_content("saved successfully.")
    expect(page).to have_content("Von Christian")
  end
  end
