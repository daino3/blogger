ActiveAdmin.register BlogPost do
  config.batch_actions = true

  controller do
    def scoped_collection
      BlogPost.includes(:tags)
    end

    def create
      params[:blog_post].delete(:selected_tags)
      super
    end

    def update
      params[:blog_post].delete(:selected_tags)
      super
    end
  end

  collection_action :render_markdown do
    @text = params["text"]
    render partial: "shared/markdown", locals: { text: @text }
  end

  index do
    selectable_column
    column :title
    column :summary
    column :body do |f|
      div truncate(f.body, length: 350)
    end
    column 'Tags' do |post|
      post.tag_list
    end
    column :published_at
    default_actions
  end

  show do
    attributes_table do
      row :title
      row :summary
      row :body
      row 'Tags' do |post|
        post.tag_list
      end
      row :published_at
      row :created_at
      row :updated_at
    end
  end


  form :html => { :multipart => true } do |f|
    f.inputs do
      f.input "selected_tags", as: :hidden, value: f.object.tags_array
      f.input :blog_category, collection: BlogCategory.all.collect {|x| [x.name, x.id] }
      f.input :tags, as: :check_boxes, multiple: true, collection: Tag.all.collect {|x| [x.name, x.id] }
      f.input :title
      f.input :summary, input_html: { rows: 2, cols: 1 }
      f.input :body, input_html: { data: {url: render_markdown_admin_blog_posts_path(f.object.id)} }
      f.input :published
      f.input :photo, :as => :file
    end
    f.inputs "Post Format" do
      f.template.render partial: "shared/markdown_container", locals: {text: f.object.body}
    end
    f.actions
  end
end
