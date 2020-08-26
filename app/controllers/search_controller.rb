class SearchController < ApplicationController
  def search
    @results = Book.search(query: {
      bool: {
        should: [
          {
            match: {
              title: {
                query: params[:term],
                operator: "and"
              }
            }
          },
          {
            nested: {
              path: :authors,
              query: {
                match: {
                  "authors.name": {
                    query: params[:term],
                    operator: "and"
                  } 
                }
              },
              "inner_hits": { 
                "highlight": {
                  "fields": {
                    "authors.name": {}
                  }
                }
              }
            }
          }
        ]
      }
    },
    highlight: {
      fields: {
        title: { type: "unified" }
      }
    })
  end
end