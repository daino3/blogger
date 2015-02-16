class SearchesController < ApplicationController
  HIGHLIGHTED_FIELDS = ["summary", "title", "body", "tag_list"]
  
  def find
    text = params[:search][:text]
    @categories = BlogCategory.all
    response    = BlogPost.search(
                              {query: {
                                multi_match: {
                                  query: text,
                                  fields: HIGHLIGHTED_FIELDS 
                                }
                              },
                                highlight: {
                                  pre_tags: ["<span class='highlight'>"],
                                  post_tags: ["</span>"],
                                  fields: {
                                    summary: {},
                                    title: {},
                                    body: {},
                                    tag_list: {}
                                  }
                                },
                                explain: true
                              }).response

    hits = map_search_results(response)
    @posts = Kaminari.paginate_array(hits).page(params[:page]).per(5)
  end

  private

  def map_search_results(response)
    hits = response.hits.hits 
    hits.map do |hit|
      post = BlogPost.find(hit._source.id)
      post.instance_eval do
        HIGHLIGHTED_FIELDS.each do |field|
          define_singleton_method "hi_#{field}" do
            self.instance_variable_get("@hi_#{field}")
          end

          define_singleton_method "hi_#{field}=" do |arg|
            self.instance_variable_set("@hi_#{field}", arg)
          end
        end
      end
      HIGHLIGHTED_FIELDS.each do |field|
        post.send("hi_#{field}=", hit.highlight.send(field)) if post.respond_to?("hi_#{field}")
      end
      post
    end
  end

end
