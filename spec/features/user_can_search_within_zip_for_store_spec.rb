require 'rails_helper'

RSpec.feature 'User can search for a store in ZIP' do
  scenario 'user sees first 10 stores within 25 miles' do
    visit root_path

    fill_in "Find Stores near your ZIP", with: "80202"
    click_button "Search"

    expect(current_path).to eq search_path

    stores = page.all('.store')
    expect(stores.count).to eq 10
    expect(page).to have_content 'Stores within 25 miles of 80202'
    expect(page).to have_content '17 Total Stores'
    expect(stores.first).to have_content "Name:"
    expect(stores.first).to have_content "City:"
    expect(stores.first).to have_content "Distance:"
    expect(stores.first).to have_content "Phone Number:"
    expect(stores.first).to have_content "Store Type:"
    expect(page).to have_link "Next Page", search_path
  end
end
