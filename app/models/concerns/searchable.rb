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
            tokenizer: 'ngram_tokenizer',
            filter: [
              'lowercase',
              'my_ascii_folding',
              'classic',
              'kstem',
              'word_delimiter',
              'my_english_stop'
            ]
          },
          ngram_analizer_names: {
            tokenizer: 'ngram_tokenizer',
            filter: [
              'lowercase',
              'my_ascii_folding'
            ]
          }
        },
        tokenizer: {
          ngram_tokenizer: {
            type: 'edge_ngram',
            min_gram: 1,
            max_gram: 10,
            token_chars: ['letter']
          }
        },
        filter: {
          my_ascii_folding: {
            type: "asciifolding",
            preserve_original: true
          },
          my_english_stop: { 
            type: "stop",
            stopwords: "_english_"
          }
        }
      }
    }
  end
end