class ReviewsController < ApplicationController
    wrap_parameters format: []

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response

    def index
        # session[:user_id] = "user"
        puts "WHATS UP PARTY PEOPLE THIS IS #{current_user ? current_user.username : "NOT LOGGED IN"}"

        if current_user == nil
            render json:[]
        else
            reviews = current_user.reviews
            render json: reviews 
        end
    end

    def update
        review = find_review
        review.update(
            note: params[:note]
        )
        render json: review
    end


    def show 
        review = Review.find(params[:id])
        render json:review
    end
    
    def create
        review = Review.new(review_params)
        bakery_id = Bakery.all.sample.id
        user_id = current_user.id
        review.bakery_id = bakery_id
        review.user_id = user_id
        review.save
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