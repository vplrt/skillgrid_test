require 'rails_helper'

feature "Guest user:" do

  before :each do
    @product = create(:pro)
    @user = create(:user)
  end

  scenario "can see Pro products on products#index page" do
    signin(@user.email, @user.password, :user)
    visit root_path
    expect(page).to have_content "Pro"
  end

  scenario "can see Pro products on products#show page" do
    signin(@user.email, @user.password, :user)
    visit products_path @product
    expect(page).to have_content "Pro"
  end
end

