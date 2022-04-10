class BooksController < ApplicationController

  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  def index
    render json: Book.all
  end

  def create
    #book = Book.new(title: params[:title], author: params[:author])
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!

    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end

  def not_destroyed
    render json: {}, status: :unprocessable_entity
  end
end
