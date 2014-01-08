class BooksController < ApplicationController
	before_action :signed_in_user

  def index
    @books = Book.paginate page: params[:page], per_page: 8
  end

  def show
    @book = Book.find params[:id]
    @reviews = @book.reviews.paginate page: params[:page], per_page: 8
  end

end
