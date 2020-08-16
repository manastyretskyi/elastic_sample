class SearchController < ApplicationController
  def search
    @results =  Book.where('title LIKE ?', "%#{params[:search]}%") 
  end
end
