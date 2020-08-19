class SearchController < ApplicationController
  def search
    @results = Elasticsearch::Model.search(params[:term], [Book, Author]).results.to_a.map(&:as_json)

  end
end
