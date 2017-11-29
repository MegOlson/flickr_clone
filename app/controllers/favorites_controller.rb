class FavoritesController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @favorite = @image.favorites.new
    @favorite.user = current_user
    if @favorite.save
      flash[:notice] = "Image Favorited!"
    else
      flash[:alert] = "Something went wrong."
    end
    redirect_to image_path(@image)
  end

  def destroy
    @image = Image.find(params[:image_id])
    @favorite = @image.favorites.find(params[:id])
    @favorite.destroy
    flash[:notice] = "Image Unfavorited."
    redirect_to image_path(@image)
  end
end
