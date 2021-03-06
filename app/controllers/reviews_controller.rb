class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    # if @restaurant.reviews.empty?
    #   flash[:notice] = 'Can only add one review'
    #   redirect_to restaurants_path
    # else
      @restaurant.reviews.create(review_params)
      redirect_to restaurants_path
    # end
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
