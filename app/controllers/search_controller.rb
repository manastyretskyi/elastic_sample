class SearchController < ApplicationController
  def search
    @results =  Book.where(id: Book.search(query: {
                                             multi_match: {
                                               query: params[:search],
                                               fuzziness: "AUTO",
                                               fields: [:title, :genre]
                                              },
                                            }).results.map(&:_id)).reverse
  end
end
