require 'rails_helper'

feature 'Applying for a loan', type: :feature do
  #  before (:each) do
  #    user = FactoryGirl.create(:user)
  #    login_as(user, :scope => :user)
  #  end
  given! (:user) { create(:user)}
  given! (:occupation) {create(:occupation, user: user)}
  given! (:loan_product) { create(:loan_product, name: "Salary Loan")}
  scenario 'with valid information' do
    visit loans_section_user_path(user)
    click_link "New Loan"
    choose "Salary Loan"
    fill_in "Amount", with: 130_000
    fill_in "Date",  with: Time.zone.now

    click_button "Apply"
    expect(page).to have_content("created successfully.")
    expect(page).to have_content("Salary Loan")
    expect(page).to have_content("130,000")
  end
  end
