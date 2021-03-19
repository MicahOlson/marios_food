class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 60 }
end
