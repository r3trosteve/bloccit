class UsersController < Devise::SessionsController

	private
		def user_params
			params.require(:user).permit(:name, :email, :password_confirmation, :password)
		end
end