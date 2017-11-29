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

  def update
    @image = Image.find(params[:image_id])
    @category = Category.find(params[:category][:id])
    if !@image.categories.include?(@category)
      @category.images.push(@image)
      flash[:notice] = "Category added!"
    else
      flash[:alert] = "This category is already applied."
    end
    redirect_to image_path(@image)
  end

private
  def category_params
    params.permit(:name)
  end
end
