ActiveAdmin.register Photo do

  config.filters = false

  form html: { multipart: true } do |f|
    f.inputs :title
    f.inputs :url, as: :file, :hint => f.template.image_tag(f.object.url(:thumb))
    f.actions
  end

  index do
    column :title
    column :file_location
    column :created_at
    column "Thumbnail" do |photo|
      image_tag(photo.get_url(type: "thumb"))
    end
    default_actions
  end
end
