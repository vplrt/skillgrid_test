require 'rails_helper'

feature 'User delete:', :devise do

  scenario 'user can delete own account' do
    user = create(:user)
    signin(user.email, user.password)
    visit edit_user_registration_path
    expect do
      click_link 'Cancel my account'
    end.to change(User, :count).by(-1)
    expect(page).to have_content I18n.t 'devise.registrations.destroyed'
  end

end
