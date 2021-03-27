require 'rails_helper'

RSpec.describe "the sign-out a user process", type: :feature do
  it "signs out a user" do
    make_test_user
    visit signout_path
    expect(page).to have_content "You've signed out."
    expect(page).to have_content 'Sign In'
  end
end
