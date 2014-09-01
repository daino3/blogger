ActiveAdmin.register BlogCategory do

  form  do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  controller do

    def add_tag
      # TODO: Get this to work
      @category = BlogCategory.find(params[:id])
      @show.add_keywords(params[:keywords]) unless params[:keywords].blank?
      respond_to do |format|
        if @category.save
          format.js
        else
          format.js { render json: @show.errors, status: :unprocessable_entity }
        end
      end
    end

    def remove_tag
      # TODO: Get this to work
      @category = BlogCategory.find(params[:id])
      @show.remove_keywords(params[:keywords]) unless params[:keywords].blank?
      respond_to do |format|
        if @category.save
          format.js { head :ok }
        else
          format.js { render json: @show.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  
end
