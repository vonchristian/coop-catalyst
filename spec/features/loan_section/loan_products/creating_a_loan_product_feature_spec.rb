require 'rails_helper'

feature 'Creating a loan product', type: :feature do
  #  before (:each) do
  #    user = FactoryGirl.create(:user)
  #    login_as(user, :scope => :user)
  #  end

  scenario 'with valid information' do
    visit loans_section_loan_products_path
    click_link "New Loan Product"
    fill_in "Name", with: "Salary Loan"
    fill_in "Term", with: 12
    fill_in "Interest Rate",  with: 12
    choose "Annually"

    click_button "Create Loan Product"
    expect(page).to have_content("created successfully.")
    expect(page).to have_content("Salary Loan")
  end
  end
