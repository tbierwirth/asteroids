require 'rails_helper'

RSpec.describe 'Guest User' do
  it "I can see the most dangerous day when I enter start and end dates" do
    visit root_path
    fill_in "start_date", with: "2018-01-01"
    fill_in "end_date", with: "2018-01-07"

    click_on "Determine Most Dangerous Day"

    expect(current_path).to eq(most_dangerous_day_path)
    expect(page).to have_content ("Most Dangerous Day")
    within "#date-range" do
      expect(page).to have_content ("January 01, 2018 - January 07, 2018")
    end

    within "#most_dangerous_day" do
      expect(page).to have_content("January 01, 2018")
    end

    within "#asteroids" do
      expect(page).to have_css(".asteroid", count: 3)
      expect(page).to have_content("Name: (2014 KT76)")
      expect(page).to have_content("NEO Reference ID: 3672906")

      expect(page).to have_content("Name: (2001 LD)")
      expect(page).to have_content("NEO Reference ID: 3078262")

      expect(page).to have_content("Name: (2017 YR1)")
      expect(page).to have_content("NEO Reference ID: 3794979")
    end

  end
end
