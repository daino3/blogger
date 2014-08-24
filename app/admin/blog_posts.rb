ActiveAdmin.register BlogPost do

  index do                            
    column :title                     
    column :body        
    column :published_at           
    default_actions                   
  end    
end
