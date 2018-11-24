class UsersController < ApplicationController
	before_action :authenticate_user!
	def new
		@books = Book.new
	end

	def index
		@user = current_user
		@book= Book.new
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		redirect_to user_path(@user.id)
		flash[:success] = "successfully."
		else
		render :action => "edit"
		end
	end

	def top

	end

	private
	def user_params
		params.require(:user).permit(:username, :profile_image, :introduction)
	end

end