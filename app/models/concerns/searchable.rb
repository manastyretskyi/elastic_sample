require "elasticsearch/model"

module Searchable
  extend ActiveSupport::Concern

  included do |base|
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    
    base.const_set :SEARCH_SETTINGS, {
      analysis: {
        analyzer: {
          ngram_analizer_titles: {
            tokenizer: 'custom_tokenizer',
            filter: [
              'lowercase',
              'my_ascii_folding',
              'classic',
              'kstem',
              'word_delimiter',
              'ngram_filter',
              'stop'
            ]
          },
          ngram_analizer_names: {
            tokenizer: 'custom_tokenizer',
            filter: [
              'lowercase',
              'my_ascii_folding',
              'ngram_filter',
              'stop'
            ]
          }
        },
        tokenizer: {
          custom_tokenizer: {
            type: "classic"
          }
        },
        filter: {
          my_ascii_folding: {
            type: "asciifolding",
            preserve_original: true
          },
          ngram_filter: {
            type:        'edge_ngram',
            min_gram:    2,
            max_gram:    10,
            token_chars: ['letter']
          }
        }
      }
    }
  end
end