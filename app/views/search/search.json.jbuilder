json.array! @results do |book|
  json.id book.id
  json.title book.title
  json.genre book.genre
end