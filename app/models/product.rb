class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :name, length: { maximum: 60 }
  validates :cost, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
  validates :country_of_origin, presence: true
  validates :country_of_origin, length: { maximum: 60 }

  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
  
  scope :most_recent, -> { order(created_at: :desc).limit(3)}

  scope :local_usa, -> { where(country_of_origin: "United States of America") }

  before_save(:titleize)

  private
    def titleize
      self.name = self.name.titleize
      self.country_of_origin = self.country_of_origin.titleize
    end
end
