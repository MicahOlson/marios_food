require 'rails_helper'

RSpec.describe 'the add a product review path', type: :feature do
  it 'adds a product review through the product detail page' do
    make_test_user
    test_product = Product.create(name: 'flounder', cost: '12.99', country_of_origin: 'china')
    visit product_path(test_product)
    click_link 'add a review'
    fill_in 'Author', with: 'Rita Booke'
    fill_in 'Rating', with: '5'
    fill_in 'Content body', with: 'Ut nulla similique. Suscipit non repellendus. Sit dicta quisquam. Quos quisquam nam. Iste vel et.'
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Ut nulla similique.'
  end
  
  it "gives an error when no author is entered" do
    make_test_user
    test_product = Product.create(name: 'flounder', cost: '12.99', country_of_origin: 'china')
    visit new_product_review_path(test_product)
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
  end

  it "gives an error for unauthorized users" do
    test_product = Product.create(name: 'cous cous', cost: '0.99', country_of_origin: 'colombia')
    visit new_product_review_path(test_product)
    expect(page).to have_content "You must be signed in to perform that action."
  end
end
