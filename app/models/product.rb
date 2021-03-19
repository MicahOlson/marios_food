class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 60 }
  validates :cost, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
  validates :country_of_origin, presence: true
  validates :country_of_origin, length: { maximum: 60 }
end
