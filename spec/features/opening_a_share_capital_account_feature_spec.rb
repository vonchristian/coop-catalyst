require 'rails_helper'

feature "Opening a share_capital account" do
  given! (:user) { create(:user)}
  given! (:occupation) { create(:occupation, user: user)}
  scenario "with valid information" do
    visit user_path(user)
    click_link "Open Share Capital Account"
    fill_in "Date opened", with: Time.zone.now
    fill_in "Account number", with: '00-999012'
    click_button "Open Share Capital"

    expect(page).to have_content("opened successfully.")
    expect(page).to have_content("00-999012")
  end
end
