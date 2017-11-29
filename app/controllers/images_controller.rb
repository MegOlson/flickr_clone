class ImagesController < ApplicationController
   skip_before_action :authenticate_user!, :only => [:index]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @images = @user.images
    else
      @images = Image.all
    end
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
    @categories = Category.all
    @category = Category.first
    @users = User.all
  end

  def edit
    @image = Image.find(params[:id])
    if @image.user == current_user
      render :edit
    else
      flash[:alert] = "I can't let you do that."
      redirect_to image_path(@image)
    end
  end

  def update
    @image = Image.find(params[:id])
    if @image.user == current_user
      if @image.update(image_params)
        flash[:notice] = "Updates saved!"
        redirect_to image_path(@image)
      else
        flash[:alert] = "Something went wrong!"
      end
    else
      flash[:alert] = "I can't let you do that."
      redirect_to image_path(@image)
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.user == current_user
      @image.destroy
      flash[:notice] = "Image deleted."
      redirect_to images_path
    else
      flash[:alert] = "I can't let you do that."
      redirect_to image_path(@image)
    end
  end

private
  def image_params
    params.require(:image).permit(:title, :caption, :photo)
  end

end
