# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 500.times do
#   FactoryBot.create(:book)
# end

# require 'csv'    

# csv_text = File.read(Rails.root.join('db', 'books.csv'))
# csv = CSV.parse(csv_text, :headers => true, liberal_parsing: true)
# csv[0...100].each do |row|
#   book_data = row.to_hash
#   book = Book.create!(book_data.select {|k,v| ["title"].include?(k) })
#   book_data['authors'].split('/').each do |author_name|
#     book.authors << Author.find_or_create_by(name: author_name)
#   end
# end

100.times do
  FactoryBot.create(:country_region)
end

100.times do
  FactoryBot.create(:city)
end

2_000_000.times do
  FactoryBot.create(:user)
end