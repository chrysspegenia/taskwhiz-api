class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :update_password]
    
    # GET /users/id
    def show
      render json: UserSerializer.new(@user).serializable_hash[:data][:attributes]
    end

    # PATCH /users/id
    def update
      if @user.update(user_params)
        render json: {
          message: "Successfully updated user information.",
          data: UserSerializer.new(@user).serializable_hash[:data][:attributes]
        }
      else
        render json: { 
          error: "Failed to update user information.",
          details: @user.errors.full_messages
        }
      end
    end

    # PATCH /users/update_password
    def update_password
      if @user.update_with_password(user_password_params)
        render json: { message: "Your password has been updated successfully." }
      else
        render json: { 
          error: "Unable to update password. Ensure all fields are correct and try again.",
          details: @user.errors.full_messages
        }
      end
    end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end

    def user_password_params
      params.require(:user).permit(:password, :password_confirmation, :current_password)
    end
end