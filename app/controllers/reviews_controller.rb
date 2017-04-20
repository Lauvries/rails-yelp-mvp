class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(reviews_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant
    else
      render :new
    end
  end

private

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
