require 'rails_helper'

feature "user can search for foods" do
  scenario "user submits valid food keyword", :vcr do
    visit '/'

    fill_in :q, with: "potatoes"
    click_on "Search"

    expect(current_path).to eq(foods_path)

    food_items = all('.food-item')
    expect(food_items.count).to eq(10)

    within(food_items.first) do
      expect(page).to have_selector('.gtin-upc')
      expect(page).to have_selector('.description')
      expect(page).to have_selector('.brand-owner')
      expect(page).to have_selector('.ingredients')
    end

    expect(page).to have_text("GTIN/UPC")
    expect(page).to have_text("Description")
    expect(page).to have_text("Brand Owner")
    expect(page).to have_text("Ingredients")
  end
end
