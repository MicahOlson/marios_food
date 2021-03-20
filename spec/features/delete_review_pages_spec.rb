require 'rails_helper'

RSpec.describe "the delete a review process", type: :feature do
  it "deletes a product review" do
    test_product = Product.create(name: 'soy flour', cost: '3.49', country_of_origin: 'mexico')
    test_review = Review.create(author: 'Al Luminum', content_body: 'Aut ut rerum. Eos vel quo. Ea hic neque. Odit veritatis ex. Vel et soluta.', rating: 4, product_id: test_product.id)
    visit  product_review_path(test_product, test_review)
    click_link 'Delete review'
    expect(page).to have_content 'Review successfully deleted!'
    expect(page).not_to have_content 'Al Luminum'
  end
end
