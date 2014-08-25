ActiveAdmin.register Page do

  collection_action :render_markdown do 
    binding.pry
    @text = params["text"]
    render partial: "shared/markdown"
  end

  index do                            
    column :name                     
    column :body        

    default_actions                   
  end

  form do |f|
    f.inputs "Pages" do
      f.semantic_errors *f.object.errors.keys
      f.input :name
      f.input :body, input_html: { data: {url: render_markdown_admin_pages_path(f.object.id)} }
    end
    f.inputs "Body Format" do
      f.template.render partial: "shared/markdown_container", locals: {text: f.object.body}
    end
    f.actions
  end   
end
