module SearchService
  class Suggest < SearchService::Base
    def search
      Elasticsearch::Model.search(query, [Author, Book])
    end

    def query
      {
        query: {
          multi_match: {
            query: term,
            fields: ["name", "title"],
            fuzziness: "auto",
            operator: "and"
          }
        },
        highlight: {
          fields: {
            name: {type: 'plain'},
            title: {type: 'plain'}
          }
        }
      }
    end
  end
end