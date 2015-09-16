require 'rails_helper'

feature "Delete product:" do
  before :each do
    @product = create(:product)
  end

  scenario "non-registered user cant delete products" do
    visit product_path @product
    expect(page).to have_no_link "Delete"
    expect{
      page.driver.submit :delete, product_path(@product), {}
    }.to change(Product,:count).by(0)
    expect(current_path).to eq new_user_session_path
  end

  scenario "registered user can delete own product" do
    signin(@product.user.email, @product.user.password)
    visit product_path @product
    expect(page).to have_link "Delete"
    expect{
      page.driver.submit :delete, product_path(@product), {}
    }.to change(Product,:count).by(-1)
    expect(current_path).to eq root_path
  end

  scenario "registered user cant delete foreign product" do
    user = create(:user, email: "other_user@example.com")
    signin(user.email, user.password)
    visit product_path @product
    expect(page).to have_no_link "Delete"
    expect{
      page.driver.submit :delete, product_path(@product), {}
    }.to change(Product,:count).by(0)
    expect(page).to have_content("Only product owner is allowed to perform this action!")
  end
end
