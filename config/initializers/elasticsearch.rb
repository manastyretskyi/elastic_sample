Elasticsearch::Model.client = Elasticsearch::Client.new(log: true, host: Rails.configuration.elasticsearch.fetch(:url) {'http://localhost:9200'})
