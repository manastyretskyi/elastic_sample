require 'elasticsearch/extensions/test/cluster'

cluster = Elasticsearch::Extensions::Test::Cluster::Cluster.new(
            port: Rails.configuration.elasticsearch.fetch(:port) {9250},
            number_of_nodes: 1,
            timeout: 120,
            command: '~/elasticsearch-7.9.0/bin/elasticsearch'
          )

RSpec.configure do |config|
  config.before :all, elasticsearch: true do
    cluster.start unless cluster.running?
    SearchService::Constants::MODELS_TO_SEARCH.each do |model|
      if model.respond_to?(:__elasticsearch__)
        begin
          model.__elasticsearch__.create_index!
          model.__elasticsearch__.refresh_index!
        rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
        rescue => e
          STDERR.puts "There was an error creating the elasticsearch index for #{model.name}: #{e.inspect}"
        end
      end
    end
  end
  
  config.after :suite do
    SearchService::Constants::MODELS_TO_SEARCH.each do |model|
      if model.respond_to?(:__elasticsearch__)
        begin
          model.__elasticsearch__.delete_index!
        rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
        rescue => e
          STDERR.puts "There was an error removing the elasticsearch index for #{model.name}: #{e.inspect}"
        end
      end
    end
    cluster.stop if cluster.running?
  end
end