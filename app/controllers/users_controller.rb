class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def index 
        render json: User.all 
    end

    def create
        user = User.create(user_params)  
        user.update(admin: false) unless params["admin"].present?

        if user.valid?
            session[:user_id] = user.id
            HelloMailer.welcome_email(user).deliver     

            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end

    end

    def show
        user = User.find_by(id: session[:user_id])

        if user
            render json: user, status: :ok
        else
            render json: {error: ["Not found"]}, status: :not_found
        end

    end

    private

    def user_params
        params.permit(
            :name,
            :password,
            :admin,
            :email
        )
    end
end
