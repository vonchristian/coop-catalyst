require 'rails_helper'

feature 'Account management', type: :feature do
  #  before (:each) do
  #    user = FactoryGirl.create(:user)
  #    login_as(user, :scope => :user)
  #  end

  scenario 'with valid information' do
    visit accounting_accounts_path
    click_link "New Account"
    fill_in "Name", with: "Accounts Payable"
    fill_in "Code", with: "001"
    choose "Accounting::Accounts::Asset"

    click_button "Save Account"

    expect(page).to have_content("saved successfully.")
    expect(page).to have_content("Accounts Payable")
  end
  end
