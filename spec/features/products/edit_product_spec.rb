require 'rails_helper'

feature "Edit product:" do
  before :each do
    @product = create(:product)
  end

  scenario "non-registered user cant Edit products" do
    visit product_path @product
    expect(page).to have_no_link "Edit"
    visit edit_product_path @product
    expect(current_path).to eq new_seller_session_path
  end

  scenario "registered seller can Eedit own product" do
    signin(@product.seller.email, @product.seller.password, :seller)
    visit product_path @product
    click_link "Edit"
    expect(current_path).to eq edit_product_path @product
    fill_in "Title", with: "Other title"
    fill_in "Description", with: "Other Description"
    attach_file "Image", "spec/support/test.png"
    click_button "Update Product"
    expect(page).to have_content "Other title"
  end

  scenario "registered seller cant Edit foreign product" do
    seller = create(:seller, email: "other_user@example.com")
    signin(seller.email, seller.password, :seller)
    visit product_path @product
    expect(page).to have_no_link "Edit"
    visit edit_product_path @product
    expect(page).to have_content("Only product owner is allowed to perform this action!")
  end
end
