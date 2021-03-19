require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'associations' do
    it { should belong_to(:product) }
  end

  describe 'validations' do
    it { should validate_presence_of(:author) }
    it { should validate_length_of(:author).is_at_most(30) }
    it { should validate_presence_of(:content_body) }
    it { should validate_length_of(:content_body).is_at_most(255) }
    it { should validate_presence_of(:rating) }
  end
end
