production_location = Rails.root.join('../..','shared', 'elasticsearch.yml')
local_location = Rails.root.join('..', 'elasticsearch.yml')

es_file = if File.exists?(production_location)
            production_location
          else
            local_location
          end

YAML.load_file(es_file)[Rails.env].each do |key, value|
  ENV[key.to_s] = value
end

Elasticsearch::Model.client = Elasticsearch::Client.new({url: ENV['elastic_search_url'], logs: true})
Kaminari::Hooks.init
Elasticsearch::Model::Response::Response.__send__ :include, Elasticsearch::Model::Response::Pagination::Kaminari
