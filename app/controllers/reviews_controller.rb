class ReviewsController < ApplicationController
  def new
    puts "IAM HEREEEEE"
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      puts "AVERAGE: #{calculate_average_rating}"
      @restaurant.average_rating = calculate_average_rating
      @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:restaurant_id, :content, :rating)
  end

  def calculate_average_rating
    puts "Restaurant_id: #{params[:restaurant_id]}"
    reviews = Review.where(restaurant_id: params[:restaurant_id])
    puts reviews
    count = 0
    value = 0 # review_params["review"]["rating"].to_i
    reviews.each do |review|
      count += 1
      value += review.rating
    end
    return value / count.to_f
  end
end
