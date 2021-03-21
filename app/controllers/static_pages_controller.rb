class StaticPagesController < ApplicationController
  def home
    @most_reviewed_products = Product.most_reviews
    @most_recent_products = Product.most_recent
    @local_to_usa = Product.local_usa
    render :home
  end
end
