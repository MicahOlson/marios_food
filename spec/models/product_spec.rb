require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should have_many(:reviews).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(60) }
    it { should validate_presence_of(:cost) }
    it { should validate_numericality_of(:cost).is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:country_of_origin) }
    it { should validate_length_of(:country_of_origin).is_at_most(60) }
  end

  describe 'Product#titleize' do
    it 'titleizes the product name and country of origin ' do
      product = Product.create({name: 'corn on the cob', cost: 1.99, country_of_origin: 'argentina'})
      expect([product.name, product.country_of_origin]).to eq(["Corn On The Cob", "Argentina"])
    end
  end
end
