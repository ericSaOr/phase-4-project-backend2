class ReviewsController < ApplicationController
    wrap_parameters format: []

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response

    def index
        # session[:user_id] = "user"
        reviews = Review.all
        render json: reviews 
    end

    def show 
        review = Review.find(params[:id])
        render json:review
    end
    
    def create
        review = Review.create!(review_params)
        render json: review, status: :created
    end


    def destroy
        review = find_review
        render json: review.destroy 
        
    end


        private

        def find_review
            Review.find(params[:id])
        end

        def review_params
            params.permit(:note, :user_id, :bakery_id)
        end

        def invalid_response(invalid)
            render json: {errors: "validation errors"}, status: :unprocessable_entity
        end
    
        def render_not_found_response(exception)
            render json: {error:"#{exception.model} not found"}, status: :not_found
        end 
    
    
end