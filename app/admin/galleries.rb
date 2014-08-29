ActiveAdmin.register Gallery do
  
  form html: { multipart: true } do |f|
    f.inputs do
      f.input :title
      f.has_many :photos do |photo|
        photo.input :title
        photo.input :url, :hint => f.template.image_tag(photo.object.url(:thumb))
      end
    end
    f.actions
  end  

  index do 
    column :title
    column :photos do |gallery|
      gallery.photos.each do |photo|
        link_to(image_tag(photo.url(:thumb), :height => '100'))
      end
    end
    default_actions
  end
end
