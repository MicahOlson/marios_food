require 'rails_helper'

RSpec.describe "the sign-in a user process", type: :feature do
  it "signs in a new user" do
    test_user = User.create(username: 'Mel Function', email: 'MelFunction@email.com', password: 'Password1!', password_confirmation: 'Password1!')
    visit signin_path
    fill_in 'email', with: 'Mel Function'
    fill_in 'Password', with: 'Password1!'
    click_button 'Sign in'
    expect(page).to have_content "You've signed in."
    expect(page).to have_content 'Mel Function'
  end

  it "gives an error when no name is entered" do
    visit signin_path
    click_button 'Sign in'
    expect(page).to have_content "There was a problem signing in. Please try again."
  end
end
