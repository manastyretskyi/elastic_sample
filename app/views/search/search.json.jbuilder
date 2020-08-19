json.array! @results do |hit|
  json.id hit['_id']
  case hit['_index'] 
  when 'books'
    book = hit['_source']
    json.type 'book'
    json.title book['title']
    json.authors json.array book['authors'] do |author|
      json.id author['id']
      json.name author['name']
    end
  when 'authors'
    author = hit['_source']
    json.type 'author'
    json.name author['name']
  end
end