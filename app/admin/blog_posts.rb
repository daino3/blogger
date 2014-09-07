ActiveAdmin.register BlogPost do
  controller do
    def scoped_collection
      BlogPost.includes(:tags)
    end
  end

  collection_action :render_markdown do
    @text = params["text"]
    render partial: "shared/markdown", locals: { text: @text }
  end

  index do
    column :title
    column :summary
    column :body
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


  form do |f|
    f.inputs do
      f.input :blog_category, collection: BlogCategory.all.collect {|x| [x.name, x.id] }
      f.input :tags, as: :check_boxes, multiple: true, collection: Tag.all.collect {|x| [x.name, x.id] }
      f.input :title
      f.input :summary, input_html: { rows: 2, cols: 1 }
      f.input :body, input_html: { data: {url: render_markdown_admin_blog_posts_path(f.object.id)} }
      f.input :published_at, as: :datepicker
    end
    f.inputs "Post Format" do
      f.template.render partial: "shared/markdown_container", locals: {text: f.object.body}
    end
    f.actions
  end
end
