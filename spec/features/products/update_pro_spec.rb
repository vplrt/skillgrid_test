require 'rails_helper'

feature "Update pro field:" do
  before :each do
    @product = create(:product)
    @admin = create(:admin)
  end

  scenario "admin can check pro field of the product" do
    signin(@admin.email, @admin.password, :admin)
    visit product_path @product
    click_link "Edit"
    check 'product_pro'
    click_button "Update Product"
    expect(page).to have_content "The product has been successfully updated."
  end

  scenario "seller cant Update pro field" do
    signin(@product.seller.email, @product.seller.password, :seller)
    visit product_path @product
    click_link "Edit"
    expect(page).not_to have_content "Check this to make it Pro."
  end
end
