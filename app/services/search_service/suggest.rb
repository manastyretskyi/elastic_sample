module SearchService
  class Suggest < SearchService::Base
    def search
      Elasticsearch::Model.search(query, SearchService::Constants::MODELS_TO_SEARCH)
    end

    def query
      {
        query: {
          multi_match: {
            query:     term,
            fields:    ["name", "title"],
            fuzziness: "auto",
            operator:  "and"
          }
        },
        highlight: {
          fields: {
            name:  { boundary_scanner: 'word', type: 'plain' },
            title: { boundary_scanner: 'word', type: 'plain' }
          }
        }
      }
    end
  end
end