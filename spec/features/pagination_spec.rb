require 'rails_helper'

feature "Pagination on Products index:" do

  before :each do
    30.times {create(:product)}
    visit root_path
  end

  scenario "first page shows last (with id=30) product" do
    expect(page).to have_link Product.last.title
  end

  scenario "first page doesnt show first (with id=1) product" do
    expect(page).not_to have_link Product.first.title
  end


  scenario "second page shows first (with id=1) product" do
    click_link "2"
    expect(page).to have_link Product.first.title
  end
end
