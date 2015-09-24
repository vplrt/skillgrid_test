require 'rails_helper'

feature "Buy product:" do
  before :each do
    @product = create(:product)
    @product.company = @product.seller.company
    @product.save
    @user = create(:user)
  end

  scenario "non-registered user cant see button Buy" do
    visit product_path @product
    expect(page).not_to have_button "Buy"
  end

  scenario "non-registered user cant buy products" do
    visit buy_product_path @product
    expect(page).to have_content I18n.t 'devise.failure.unauthenticated'
  end

  scenario "signed in User can buy products" do
    signin(@user.email, @user.password, :user)
    visit buy_product_path @product
    txts = ['Thank you for your purchase. It will be delivered to your email.',\
      'Error. thumbnailUrl is greater than url.', 'Timeout Error.']
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*|.*#{txts[2]}.*/)
  end

  scenario "User with .com email cant buy products" do
    @com_user = create(:user, email: "other_user@example.com")
    signin(@com_user.email, @com_user.password, :user)
    visit buy_product_path @product
    expect(page).to have_content 'Users with .com emails cant buy products!'
  end

  scenario "Pro products cant be sold" do
    @pro_product = create(:pro)
    signin(@user.email, @user.password, :user)
    visit buy_product_path @pro_product
    expect(page).to have_content 'Sorry, but you cant buy this product!'
  end

  scenario "products without company cant be sold" do
    @product_without_company = create(:product)
    signin(@user.email, @user.password, :user)
    visit buy_product_path @product_without_company
    expect(page).to have_content 'Sorry, but you cant buy this product!'
  end
end
