require 'rails_helper'

RSpec.describe "the delete a product process", type: :feature do
  it "deletes a product" do
    test_product = Product.create(name: 'corn on the cob', cost: '1.99', country_of_origin: 'argentina')
    visit product_path(test_product)
    click_link 'delete'
    expect(page).to have_content 'Product successfully deleted!'
    expect(page).not_to have_content 'Corn On The Cob'
  end
end
