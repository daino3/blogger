require 'rake'
require 'elasticsearch/extensions/test/cluster/tasks'

RSpec.configure do |config|
  config.before :all, elasticsearch: true do
    test_cluster = Elasticsearch::Extensions::Test::Cluster
    test_cluster.start(port: 9250) unless test_cluster.running?
  end

  config.after :suite do
    test_cluster = Elasticsearch::Extensions::Test::Cluster
    test_cluster.stop(port: 9250) if test_cluster.running?
  end
end
