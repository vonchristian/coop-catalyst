require 'rails_helper'

feature 'Saving an entry', type: :feature do
  #  before (:each) do
  #    user = FactoryGirl.create(:user)
  #    login_as(user, :scope => :user)
  #  end

  scenario 'with valid information' do
    amount = 500
    debit_account = create(:account, type: "Accounting::Accounts::Asset", name: "Cash on Hand")
    credit_account = create(:account, type: "Accounting::Accounts::Asset", name: "Loans Receivable")
    visit accounting_entries_path
    click_link "New Entry"
    fill_in "Date", with: Time.zone.now
    fill_in "Description", with: "Payment of Loan"
    fill_in "Reference number", with: "000111"
    fill_in "Debit Account",  with: debit_account.name
    fill_in "Debit amount", with: amount
    fill_in "Credit Account", with: credit_account.name
    fill_in "Credit amount", with: amount

    click_button "Save Entry"

    expect(page).to have_content("saved successfully.")
    expect(page).to have_content("Payment of Loan")
  end
  end
