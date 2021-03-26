require 'rails_helper'

RSpec.describe "the add a user process", type: :feature do
  it "adds a new user" do
    visit signup_path
    fill_in 'Username', with: 'Mel Function'
    fill_in 'Email', with: 'MelFunction@email.com'
    fill_in 'Password', with: 'Password1!'
    fill_in 'Password confirmation', with: 'Password1!'
    click_button 'Sign Up'
    expect(page).to have_content "You've successfully signed up!"
    expect(page).to have_content 'Mel Function'
  end

  it "gives an error when no name is entered" do
    visit signup_path
    click_button 'Sign Up'
    expect(page).to have_content "There was a problem signing up."
  end
end
