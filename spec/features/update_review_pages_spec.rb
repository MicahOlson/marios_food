require 'rails_helper'

RSpec.describe "the update a review process", type: :feature do
  it "updates a product review" do
    test_product = Product.create(name: 'oranges', cost: '1.49', country_of_origin: 'usa')
    test_review = Review.create(author: 'Ann Chovie', content_body: 'Quasi deserunt quis. Non incidunt soluta. Cum placeat ullam. Qui qui adipisci.', rating: 2, product_id: test_product.id)
    visit  product_review_path(test_product, test_review)
    click_link 'Edit review'
    fill_in 'Author', with: 'Abe Normal'
    fill_in 'Content body', with: 'Quidem molestiae aut. Beatae voluptatem voluptate. Est voluptatem facilis. Quos ut quis. Esse perferendis voluptas.'
    fill_in 'Rating', with: 1
    click_on 'Update Review'
    expect(page).to have_content 'Review successfully updated!'
    expect(page).to have_content 'Abe Normal'
  end
end
