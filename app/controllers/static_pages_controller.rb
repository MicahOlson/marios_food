class StaticPagesController < ApplicationController
  def home
    @most_reviewed_products = Product.most_reviews
    render :home
  end
end
