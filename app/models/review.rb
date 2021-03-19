class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :author, length: { maximum: 30 }
  validates :content_body, presence: true
end
