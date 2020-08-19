class Author < ApplicationRecord
  include Searchable

  settings index: { number_of_shards: 1 } do
    mappings dynamic: false do
      indexes :id, type: :integer
      indexes :name, type: :text

      indexes :books, type: 'nested' do
        indexes :id, type: :integer
        indexes :title, type: :text
      end
    end
  end

  has_many :authors_books_relationship, dependent: :destroy
  has_many :books, through: :authors_books_relationship
end
