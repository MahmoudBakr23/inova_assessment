class ReviewsController < ApplicationController
    def create
      review = Review.new(review_params)
      review.user_id = params[:user_id] # Assuming user_id is passed in params
      review.post_id = params[:post_id] # Assuming post_id is passed in params
      if review.save
        render json: review, status: :created
      else
        render json: review.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
  end
  