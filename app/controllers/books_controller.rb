class BooksController < ApplicationController
	before_action :authenticate_user!,except: [:top, :about]

	def new
		@books = Book.new
	end

	def create
		@book = Book.new(books_params)
		@book.user_id = current_user.id
		@book.save
		flash[:success] = "successfully."
		redirect_to books_path
	end

	def index
		@books = Book.all
		@user = current_user
		@book =  Book.new
	end

	def show
		@book = Book.new
		@bookdetail = Book.find(params[:id])
		#@user = User.find(params[:id])
		#@user = current_user.id
	end

	def update
		book = Book.find(params[:id])
		book.update(books_params)
		redirect_to book_path(book.id)
	end

	def destroy
		books = Book.find(params[:id])
		books.destroy
		flash[:notice] = "Book was successfully destroyed."
		redirect_to books_path
	end

	def edit
		@books = Book.find(params[:id])
	end

private
	def books_params
		params.require(:book).permit(:book_name, :caption, :user_id)
	end

end
