class BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def create
    book = Book.new(params[:title], params[:author])

    if book.save
      render json: book, status: :created
    else
      render status: :unprocessable_entity
    end
  end
end
