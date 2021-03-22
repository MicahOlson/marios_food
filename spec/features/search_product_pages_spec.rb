require 'rails_helper'

RSpec.describe "the search a product process", type: :feature do
  it "searches for a product and returns a product link if found" do
    test_product = Product.create(name: 'camomile', cost: '1.83', country_of_origin: 'el salvador')
    visit root_path
    fill_in :search, with: 'camomile'
    click_on 'Search'
    expect(page).to have_content 'Search Results'
    expect(page).to have_content 'Camomile'
  end
  
  it "searches for a product and returns a message if not found" do
    test_product = Product.create(name: 'bacon', cost: '4.95', country_of_origin: 'peru')
    visit root_path
    fill_in :search, with: 'motorcycle'
    click_on 'Search'
    expect(page).to have_content 'Search Results'
    expect(page).to have_content 'No results.'
  end
end
