class CreateAuthorsBooksRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :authors_books_relationships do |t|
      t.bigint :author_id
      t.bigint :book_id

      t.timestamps
    end

    add_foreign_key :authors_books_relationships, :authors, column: :author_id
    add_foreign_key :authors_books_relationships, :books, column: :book_id
  end
end
