module SearchSupport
  def recreate_index!
    delete_index!

    SearchService::Constants::MODELS_TO_SEARCH.each do |model|
      begin
        model.__elasticsearch__.create_index! force: true
      rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
        puts "There was an error creating the elasticsearch index
              for #{model.name}: #{e.inspect}"
      end
    end
  end

  def delete_index!
    SearchService::Constants::MODELS_TO_SEARCH.each do |model|
      begin
        model.__elasticsearch__.delete_index! force: true
      rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
        puts "There was an error deleting elasticsearch index
              for #{model.name}: #{e.inspect}"
      end
    end
  end

  def import_records
    SearchService::Constants::MODELS_TO_SEARCH.each do |model|
      begin
        model.import refresh: true
      rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
        puts "There was an error importing #{model.name}: #{e.inspect}"
      rescue
        puts "Error to import records for #{model}"
      end
    end
  end

  def clear_indices
    SearchService::Constants::MODELS_TO_SEARCH.each do |model|
      begin
        Elasticsearch::Model.client.delete_by_query(
          index: model.index_name,
          q: '*',
          body: {}
        )
      rescue
      end
    end
  end
end
