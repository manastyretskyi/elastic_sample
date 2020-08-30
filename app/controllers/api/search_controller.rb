class Api::SearchController < ApplicationController
  def search
    @results = SearchService::Suggest.search(params[:term])
  end
end