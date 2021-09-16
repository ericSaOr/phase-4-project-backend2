class UsersController < ApplicationController
    wrap_parameters format: []

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    

    def index 
        users = User.all
        render json: users
    end

    #GET /users/:id

    def show
        user = find_user
        render json: user, status: :ok
    end

    #POST /users/:id
    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    #PATCH /users/:id

    def update
        user = find_user
        user.update!(user_params)
        render json: user, status: :accepted
    end
    
    #DESTROY /users/:id

    def destroy
        user = find_user    
        user.destroy
        head :no_content
    end

    private
    def find_user
        User.find(params[:id])
    end 

    def user_params
        params.permit(:name, :password)
    end 

    def render_unprocessable_entity_response(invalid)
        render json: {erros: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_not_found_response(exception)
        render json: {error:"#{exception.model} not found"}, status: :not_found
    end 
end



    # def cookiejar
    #     puts "HEY PARTY PEOPLE I'M #{self}"
    #     session[:user_id] = "user.id"
    #     render plain: "potato"
    # end

    # def tummy
    #     puts "HEY ###### #{self}"
    #     render json: session[:user_id]
    # end
    # def create 
    #     byebug
    # end