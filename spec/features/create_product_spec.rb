require 'rails_helper'

feature "Create new product" do
  scenario "as a non-registered user" do
    visit root_path
    expect(page).not_to have_content "Add product"
    visit new_product_path
    expect(page).to have_content I18n.t 'devise.failure.unauthenticated'
  end

  scenario "as a registered user" do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit new_product_path
    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Some Description"
    attach_file "Image", "spec/support/test.png"
    expect do
      click_button "Create Product"
    end.to change(Product, :count).by(1)
  end
end
