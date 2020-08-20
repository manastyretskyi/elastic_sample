class SearchController < ApplicationController
  def search
    @results = Book.search(query: {
      bool: {
        should: [
          {
            match: {
              title: params[:term]
            }
          },
          {
            nested: {
              path: :authors,
              query: {
                match: {
                  "authors.name": params[:term]
                }
              }
            }
          }
        ]
      }
    }).results.to_a.map(&:as_json)
  end
end
