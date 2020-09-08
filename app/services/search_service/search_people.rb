module SearchService
  class SearchPeople < SearchService::Base
    def search
      Elasticsearch::Model.search(query, [City, User])
    end

    def query
      {
        query: {
          multi_match: {
            query:     term,
            fields:    ["full_name", "name"],
            fuzziness: "auto"
          }
        }
      }
    end
  end
end