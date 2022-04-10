module Api

  module V1

    class BooksController < ApplicationController

      def index
        books = Book.all
        render json: BooksRepresenter.new(books).as_json
      end

      def create
        #book = Book.new(title: params[:title], author: params[:author])

        author = Author.create!(author_params)
        book = Book.new(book_params.merge(author_id: author.id))

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

      def author_params
        params.require(:author).permit(:first_name, :last_name, :age)
      end

      def book_params
        params.require(:book).permit(:title)
      end

    end
  end
end