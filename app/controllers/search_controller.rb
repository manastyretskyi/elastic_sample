class SearchController < ApplicationController
  def search
    @results = SearchService::SuggestBook.search(params[:term])
  end
end