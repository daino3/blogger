require 'elasticsearch/rails/tasks/import'

class Indexer
  include Elasticsearch::Model

  class << self
    def perform(model)
      # passing scopes because import doesn't have knowledge
      # of instance callbacks (index_document and delete_document conditionals)
      case model.table_name
        when BlogPost.table_name
          BlogPost.import force: true
        when Tag.table_name
          Tag.import force: true
        else
          raise "Invalid argument, please pass a valid model (BlogPost, Tags)"
      end
    end
  end
end