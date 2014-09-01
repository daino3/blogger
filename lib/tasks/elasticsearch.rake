require 'elasticsearch_indexer'

# check mapping after import:
# Tt::Episode.mappings.to_hash
# Basic search Tt::Episode.search("*")
# Visit to query: http://localhost:9200/_plugin/marvel

namespace :elasticsearch do
  namespace :import do
    CLIENT = Elasticsearch::Model.client

    task :all => [:blog_posts, :tags]

    task :blog_posts => :environment do
      post_task = Proc.new { Indexer.perform(BlogPost) }
      invoke_task &post_task
      puts "Done importing blog posts"
    end

    task :tags => :environment do
      tag_task = Proc.new { Indexer.perform(Tag) }
      invoke_task &tag_task
      puts "Done importing tags"
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