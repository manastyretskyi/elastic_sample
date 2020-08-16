require 'elasticsearch/model'

class Book < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  after_commit on: [:create] do
    __elasticsearch__.index_document
  end

  after_commit on: [:update] do
      __elasticsearch__.update_document
  end

  after_commit on: [:destroy] do
    __elasticsearch__.delete_document
  end
end
