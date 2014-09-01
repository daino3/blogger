es_file = File.join(Rails.root, 'config', 'elasticsearch.yml')

YAML.load(File.open(es_file)).each do |key, value|
  ENV[key.to_s] = value
end

# Point to feeds server
case Rails.env
  when 'staging'
    Elasticsearch::Model.client = Elasticsearch::Client.new({url: ENV['ES_STAGING_URL'], logs: true})
  when 'production'
    Elasticsearch::Model.client = Elasticsearch::Client.new({url: ENV['ES_PRODUCTION_URL'], logs: true})
  else
    Elasticsearch::Model.client = Elasticsearch::Client.new({url: 'http://localhost:9200', logs: true})
end