require 'elasticsearch/model'

class Book < ApplicationRecord
  include Searchable

  settings index: { number_of_shards: 1 } do
    mappings dynamic: false do
      indexes :id, type: :integer
      indexes :title, type: :text

      indexes :authors, type: 'nested' do
        indexes :id, type: :integer
        indexes :name, type: :text
      end
    end
  end

  has_many :authors_books_relationship, dependent: :destroy
  has_many :authors, through: :authors_books_relationship

  def as_indexed_json(options = {})
    self.as_json(include: { authors: { only: [:id, :name] } })
  end
end
