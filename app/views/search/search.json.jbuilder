json.array! @results do |hit|
  json.id hit['_id']
  case hit['_index'] 
  when 'books'
    book = hit['_source']
    json.type 'book'
    json.title book['title']
    json.authors do
      json.array! book['authors'].each_with_index.to_a do |(author, index)|
        json.id author['id']
        json.name author['name']
      end
    end

    json.authors_hits do
      json.array! hit.dig('inner_hits', 'authors', 'hits', 'hits') do |author_hit|
        author = author_hit['_source']
        json.id author['id']
        json.name author['name']
        json.highlights author_hit['highlight']
      end
    end
  when 'authors'
    author = hit['_source']
    json.type 'author'
    json.name author['name']
  end


  json.highlights hit['highlight']
end