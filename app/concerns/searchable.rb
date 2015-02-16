
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    index_name "#{self.table_name}"
    document_type self.table_name

    def self.search(query, options = {})
      __elasticsearch__.search(query, options)
    end

    def index_document(options={})
      __elasticsearch__.index_document(options)
    end

    def delete_document(options={})
      __elasticsearch__.delete_document(options) rescue nil
    end

  end
end

class Hash

  def pick(*keys)
    values = values_at(*keys)
    Hash[keys.zip(values)]
  end

end
