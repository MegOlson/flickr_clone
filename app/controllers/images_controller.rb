class ImagesController < ApplicationController
   skip_before_action :authenticate_user!, :only => [:index]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user
    if @image.save
      flash[:notice] = "Image succesfully uploaded!"
      redirect_to image_path(@image)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

private
  def image_params
    params.require(:image).permit(:title, :caption, :photo)
  end

end
