require 'rails_helper'
feature "Creating a new product", type: :feature do
  scenario 'with valid information' do
    visit store_products_path
    click_link "New Product"
    fill_in "Name", with: 'Accounting System'
    fill_in "Description", with: "for cooperatives"
    fill_in "Unit", with: "package"
    fill_in "Price", with: 250_000
    fill_in "Quantity", with: 1
    fill_in "Date", with: Time.zone.now
    click_button "Save Product"

    expect(page).to have_content "created successfully."
    expect(page).to have_content "Accounting System"
    expect(page).to have_content "Quantity 1.0"
  end
end
