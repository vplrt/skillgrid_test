require 'rails_helper'

feature "Not signed in user:" do

  before :each do
    @product = create(:pro)
  end

  scenario "cant see Pro products on products#index page" do
    visit root_path
    expect(page).not_to have_content "Pro"
  end

  scenario "can see Pro products on products#show page" do
    visit products_path @product
    expect(page).not_to have_content "Pro"
  end
end

