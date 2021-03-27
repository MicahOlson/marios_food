require 'rails_helper'

RSpec.describe "the update a review process", type: :feature do
  it "updates a product review" do
    make_test_admin
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
  
  it "gives an error when no author is entered" do
    make_test_admin
    test_product = Product.create(name: 'jelly', cost: '2.99', country_of_origin: 'belguim')
    test_review = Review.create(author: 'Claire Voyance', content_body: 'Qui voluptas dolor. Et voluptatem et. Quos eos et. Placeat earum beatae.', rating: 4, product_id: test_product.id)
    visit edit_product_review_path(test_product, test_review)
    fill_in 'Author', with: ''
    fill_in 'Content body', with: ''
    fill_in 'Rating', with: 2
    click_on 'Update Review'
    expect(page).to have_content "Author can't be blank"
  end

  it "gives an error for unauthorized users" do
    make_test_user
    test_product = Product.create(name: 'nutmeg', cost: '1.49', country_of_origin: 'turkey')
    test_review = Review.create(author: 'I. M. Boring', content_body: 'If they ever come up with a swashbuckling school, I think one of the courses should be laughing, then jumping off something.', rating: 4, product_id: test_product.id)
    visit edit_product_review_path(test_product, test_review)
    expect(page).to have_content "You must be signed in as administrator to perform that action."
  end
end
