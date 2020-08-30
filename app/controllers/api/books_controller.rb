class Api::BooksController < ApplicationController
  before_action :find_book, only: :show

  def show; end

  private

  def find_book
    @book = Book.find(params[:id])
  end
end
