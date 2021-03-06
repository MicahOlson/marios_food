require 'rails_helper'

RSpec.describe "the update a product process", type: :feature do
  it "updates a product" do
    make_test_admin
    test_product = Product.create(name: 'corn on the cob', cost: '1.99', country_of_origin: 'argentina')
    visit product_path(test_product)
    click_link 'edit'
    fill_in 'Name', with: 'green pepper'
    fill_in 'Cost', with: '.79'
    fill_in 'Country of origin', with: 'canada'
    click_on 'Update Product'
    expect(page).to have_content 'Product successfully updated!'
    expect(page).to have_content 'Green Pepper'
  end
  
  it "gives an error when no name is entered" do
    make_test_admin
    test_product = Product.create(name: 'achacha', cost: '8.33', country_of_origin: 'congo')
    visit edit_product_path(test_product)
    fill_in 'Name', with: ''
    fill_in 'Cost', with: ''
    fill_in 'Country of origin', with: ''
    click_on 'Update Product'
    expect(page).to have_content "Name can't be blank"
  end

  it "gives an error for unauthorized users" do
    make_test_user
    test_product = Product.create(name: 'peaches', cost: '1.29', country_of_origin: 'united states of america')
    visit edit_product_path(test_product)
    expect(page).to have_content "You must be signed in as administrator to perform that action."
  end
end
