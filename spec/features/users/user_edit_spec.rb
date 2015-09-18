require 'rails_helper'

feature 'User edit:', :devise do
  before(:each) { @user = create(:user) }

  scenario 'user can change email address' do
    signin(@user.email, @user.password)
    visit edit_user_registration_path
    fill_in 'Email', :with => 'newemail@example.com'
    fill_in 'Current password', :with => @user.password
    click_button 'Update'
    txts = [I18n.t( 'devise.registrations.updated'), I18n.t( 'devise.registrations.update_needs_confirmation')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
    expect(User.first.email).to match 'newemail@example.com'
  end
end
