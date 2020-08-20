class Book < ApplicationRecord
  include Searchable

  settings SEARCH_SETTINGS do
    mappings dynamic: false do
      indexes :id, type: :integer
      indexes :title, type: :text, analyzer: 'ngram_analizer'

      indexes :authors, type: 'nested' do
        indexes :id, type: :integer
        indexes :name, type: :text, analyzer: 'ngram_analizer'
      end
    end
  end

  has_many :authors_books_relationship, dependent: :destroy
  has_many :authors, through: :authors_books_relationship

  def as_indexed_json(options = {})
    self.as_json(include: { authors: { only: [:id, :name] } })
  end
end
