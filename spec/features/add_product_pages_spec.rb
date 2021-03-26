require 'rails_helper'

RSpec.describe "the add a product process", type: :feature do
  it "adds a new product" do
    visit signin_path
    fill_in 'email', with: 'admin'
    fill_in 'Password', with: 'Administrator1!'
    click_button 'Sign in'
    visit products_path
    click_link 'Add a product'
    fill_in 'Name', with: 'corn on the cob'
    fill_in 'Cost', with: '1.99'
    fill_in 'Country of origin', with: 'argentina'
    click_button 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Corn On The Cob'
  end

  it "gives an error when no name is entered" do
    visit signin_path
    fill_in 'email', with: 'admin'
    fill_in 'Password', with: 'Administrator1!'
    click_button 'Sign in'
    visit new_product_path
    click_button 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end
