require 'rails_helper'

feature "Create new product:" do
  scenario "as a non-registered user" do
    visit root_path
    expect(page).not_to have_content "Add product"
    visit new_product_path
    expect(page).to have_content "Only seller is allowed to perform this action!"
  end

  scenario "as a registered seller" do
    seller = create(:seller)
    signin(seller.email, seller.password, :seller)
    visit new_product_path
    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Some Description"
    attach_file "Image", "spec/support/test.png"
    expect do
      click_button "Create Product"
    end.to change(Product, :count).by(1)
  end

  scenario "if will have automaticly filled field company" do
    seller = create(:seller)
    signin(seller.email, seller.password, :seller)
    visit new_product_path
    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Some Description"
    attach_file "Image", "spec/support/test.png"
    click_button "Create Product"
    expect(Product.last.company).to eq seller.company
  end
end
