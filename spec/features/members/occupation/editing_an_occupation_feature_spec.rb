require 'rails_helper'

feature 'Editing an occupation', type: :feature do
   before (:each) do
     user = FactoryGirl.create(:user)
     login_as(user, :scope => :user)
   end

  given! (:user) {create(:user)}
  given! (:occupation) { create(:occupation, user: user)}

  scenario 'with valid information' do
    visit user_path(user)

    click_link "Edit Occupation"
    fill_in "Employer", with: "Kiphodan Technologies, Inc."
    fill_in "Position", with: "Software Developer"
    fill_in "Employer address", with: "Lagawe, Ifugao"
    fill_in "Contact number",  with: "000-999-899"

    click_button "Update Occupation"

    expect(page).to have_content("updated successfully.")
    expect(page).to have_content("Kiphodan Technologies, Inc.")
  end
  end
