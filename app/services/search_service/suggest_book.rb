module SearchService
  class SuggestBook < SearchService::Base
    def search
      Book.__elasticsearch__.search(query)
    end


    def query
      {
        query: {
          bool: {
            should: [
              {
                match: {
                  title: {
                    query: term,
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
                        query: term,
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
        }
      }
    end
  end
  
end