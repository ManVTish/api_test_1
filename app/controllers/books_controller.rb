class BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def create
    book = Book.new(title: params[:title], author: params[:author])

    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end
end
