class StaticPagesController < ApplicationController
  def home
    @most_reviewed_products = Product.most_reviews
    @most_recent_products = Product.most_recent
    render :home
  end
end
