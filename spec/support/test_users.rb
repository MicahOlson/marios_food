def make_test_user
  test_user = User.create(username: 'Mel Function', email: 'MelFunction@email.com', password: 'Password1!', password_confirmation: 'Password1!')
  visit signin_path
  fill_in 'email', with: 'Mel Function'
  fill_in 'Password', with: 'Password1!'
  click_button 'Sign in'
end

def make_test_admin
  test_admin = User.create(username: 'admin', email: 'admin@marios.com', password: 'Administrator1!', password_confirmation: 'Administrator1!', admin: true)
  visit signin_path
  fill_in 'email', with: 'admin'
  fill_in 'Password', with: 'Administrator1!'
  click_button 'Sign in'
end
