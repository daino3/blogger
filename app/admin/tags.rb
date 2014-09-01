ActiveAdmin.register Tag do
  
  index do
    column :name                     
    column :blog_category        
    column :created_at
    default_actions       
  end

end
