class CategoriesController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @category = Category.new(category_params)
    if @category.save
      @category.images.push(@image)
      flash[:notice] = "Category created!"
    else
      flash[:alert] = "Something went wrong."
    end
    redirect_to image_path(@image)
  end

private
  def category_params
    params.permit(:name)
  end
end
