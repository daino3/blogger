
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    index_name "#{self.table_name}_#{Rails.env}"
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

    def as_indexed_json(options={})
      klass = self.class
      es_attributes = klass.mappings.to_hash[klass.document_type.to_sym][:properties].keys
      attributes.symbolize_keys.pick(*es_attributes).as_json
    end
  end
end

class Hash

  def pick(*keys)
    values = values_at(*keys)
    Hash[keys.zip(values)]
  end

end