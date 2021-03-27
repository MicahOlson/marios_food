require 'rails_helper'

RSpec.describe "the delete a review process", type: :feature do
  it "deletes a product review" do
    make_test_admin
    test_product = Product.create(name: 'soy flour', cost: '3.49', country_of_origin: 'mexico')
    test_review = Review.create(author: 'Al Luminum', content_body: 'Aut ut rerum. Eos vel quo. Ea hic neque. Odit veritatis ex. Vel et soluta.', rating: 4, product_id: test_product.id)
    visit  product_review_path(test_product, test_review)
    click_link 'Delete review'
    expect(page).to have_content 'Review successfully deleted!'
    expect(page).not_to have_content 'Al Luminum'
  end

  it "gives an error for unauthorized users" do
    make_test_user
    test_product = Product.create(name: 'black eyed beans', cost: '0.89', country_of_origin: 'mexico')
    test_review = Review.create(author: 'Bowen Arrow', content_body: 'One thing vampire children have to be taught early on is, never run with a wooden stake.', rating: 5, product_id: test_product.id)
    visit  product_review_path(test_product, test_review)
    click_link 'Delete review'
    expect(page).to have_content "You must be signed in as administrator to perform that action."
  end
end
