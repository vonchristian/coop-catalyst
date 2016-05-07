require 'rails_helper'

feature 'Creating a role', type: :feature do
  #  before (:each) do
  #    user = FactoryGirl.create(:user)
  #    login_as(user, :scope => :user)
  #  end
  scenario 'with valid information' do
    visit roles_path
    click_link "New Role"
    fill_in "Role", with: "Loan Officer"

    click_button "Create Role"
    expect(page).to have_content("created successfully.")
  end
  end
