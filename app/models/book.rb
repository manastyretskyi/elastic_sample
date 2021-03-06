class Book < ApplicationRecord
  include Searchable

  settings SEARCH_SETTINGS do
    mappings dynamic: false do
      indexes :id, type: :integer
      indexes :title, type: :text, analyzer: 'ngram_analizer_titles'
    end
  end

  has_many :authors_books_relationship, dependent: :destroy
  has_many :authors, through: :authors_books_relationship

  def as_indexed_json(options = {})
    self.as_json(include: { authors: { only: [:id, :name] } })
  end
end
