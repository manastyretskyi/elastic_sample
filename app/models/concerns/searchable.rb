require "elasticsearch/model"
module Searchable
  extend ActiveSupport::Concern
  included do |base|
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    
    base.const_set :SEARCH_SETTINGS, {
      analysis: {
        analyzer: {
          ngram_analizer: {
            tokenizer: 'ngram_tokenizer',
            filter: ['lowercase']
          }
        },
        tokenizer: {
          ngram_tokenizer: {
            type: 'edge_ngram',
            min_gram: 2,
            max_gram: 10,
            token_chars: ['letter']
          }
        }
      }
    }
  end
end