require 'rails_helper'

feature 'Saving a capital_build_up transaction', type: :feature do
   before (:each) do
     user = FactoryGirl.create(:user)
     login_as(user, :scope => :user)
   end
  given! (:share_capital) { create(:share_capital)}
  scenario 'with valid information' do
     amount = 500
     debit_account = create(:account, type: "Accounting::Accounts::Asset", name: "Cash on Hand")
     credit_account = create(:account, type: "Accounting::Accounts::Asset", name: "Share Capital")
    visit share_capital_path(share_capital)
    click_link "New Capital Build Up"
    fill_in "Date", with: Time.zone.now
    fill_in "Description", with: "Capital Build Up"
    fill_in "Reference number", with: "000111"
    fill_in "Debit Account",  with: debit_account.name
    fill_in "Debit amount", with: amount
    fill_in "Credit Account", with: credit_account.name
    fill_in "Credit amount", with: amount

    click_button "Save Capital Build Up"

    expect(page).to have_content("saved successfully.")
    expect(page).to have_content(amount)
  end
  end
