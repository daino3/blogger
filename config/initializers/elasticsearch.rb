es_file = ''
# Point to feeds server
if Rails.env.production?
  es_file = Rails.root.join('..','shared', 'elasticsearch.yml')
else
  es_file = Rails.root.join('..', 'elasticsearch.yml')
end

YAML.load_file(es_file)[Rails.env].each do |key, value|
  ENV[key.to_s] = value
end

Elasticsearch::Model.client = Elasticsearch::Client.new({url: ENV['elastic_search_url'], logs: true})
