require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should have_many(:reviews) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
