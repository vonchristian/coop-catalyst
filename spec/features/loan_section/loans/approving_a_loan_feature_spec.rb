require 'rails_helper'

feature 'Approving a loan', type: :feature do
   before (:each) do
     user = FactoryGirl.create(:user)
     login_as(user, :scope => :user)
   end
  given! (:user) { create(:user)}
  given! (:loan_product) { create(:loan_product, name: "Salary Loan")}
  given! (:loan) { create(:loan, user: user, loan_product: loan_product, amount: 130_000)}
  scenario 'with valid information' do
    visit loans_section_loan_path(loan)
    click_link "Approve"

    fill_in "Date",  with: Time.zone.now

    click_button "Approve Loan"
    expect(page).to have_content("approved successfully.")
    expect(page).to have_content("Salary Loan")
    expect(page).to have_content("130,000")
  end
  end
