require 'rails_helper'

RSpec.describe "the delete a product process", type: :feature do
  it "deletes a product" do
    test_product = Product.create(name: 'goat cheese', cost: '3.99', country_of_origin: 'greece')
    visit product_path(test_product)
    click_link 'delete'
    expect(page).to have_content 'Product successfully deleted!'
    expect(page).not_to have_content 'Goat Cheese'
  end
end
