module SessionHelpers
  def signin(email, password, role = :user)
    if role == :admin
      visit new_admin_session_path
    elsif role == :seller
      visit new_seller_session_path
    else
      visit new_user_session_path
    end
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
