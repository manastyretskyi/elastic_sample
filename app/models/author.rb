# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord
  include Searchable

  settings SEARCH_SETTINGS do
    mappings dynamic: false do
      indexes :id, type: :integer
      indexes :name, type: :text, analyzer: 'ngram_analizer_names'
    end
  end

  has_many :authors_books_relationship, dependent: :destroy
  has_many :books, through: :authors_books_relationship
end
