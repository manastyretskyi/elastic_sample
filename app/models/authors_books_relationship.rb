# == Schema Information
#
# Table name: authors_books_relationships
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint
#  book_id    :bigint
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (book_id => books.id)
#
class AuthorsBooksRelationship < ApplicationRecord
  belongs_to :author
  belongs_to :book
end
