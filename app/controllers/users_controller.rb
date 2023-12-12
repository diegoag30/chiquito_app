class UsersController < ApplicationController
    def destroy
        @user = current_user
        @user.destroy
        redirect_to new_user_session_path, notice: 'User deleted. Please log in again.'
      end
end
