require 'rails_helper'

RSpec.describe "the update a product process", type: :feature do
  it "updates a product" do
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
end
