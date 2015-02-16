require 'elasticsearch_indexer'

# check mapping after import:
# BlogPost.mappings.to_hash
# Basic search BlogPost.search("*")
# Visit to query: http://localhost:9200/_plugin/marvel

namespace :elasticsearch do
  namespace :import do

    task :blog_posts => :environment do
      Elasticsearch::Model.client.indices.delete index: "_all" rescue nil
      post_task = Proc.new { Indexer.perform(BlogPost) }
      invoke_task &post_task
      puts "Done importing blog posts"
    end

    def invoke_task &block
      begin
        puts "starting import..."
        yield
        puts "Done successfully!"
      rescue Exception => e
        puts "Failure!"
        puts e.message, e.backtrace
        Rails.logger.info "#{e.message}", "#{e.backtrace}"
      end
    end
  end
end
