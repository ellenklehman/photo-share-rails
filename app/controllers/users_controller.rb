class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Thank you for signing up!"
			session[:user_id] = @user.id
			redirect_to root_url
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		session[:user_id] = nil
		@user.destroy
		flash[:notice] = "Account has been deleted."
		redirect_to root_path
	end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
