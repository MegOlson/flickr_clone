class UserTagsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @tags = @user.user_tags
  end

  def create
    @image = Image.find(params[:image_id])
    @tag = @image.user_tags.new
    @user = User.find(params[:user][:id])
    if @user.get_tag(@image)
      flash[:alert] = "User already tagged."
      redirect_to image_path(@image)
    else
      @tag.user = @user
      if @tag.save
        UserMailer.image_tag(@user, @image).deliver
        flash[:notice] = "User tagged!"
        redirect_to image_path(@image)
      else
        flash[:alert] = "Something went wrong."
        redirect_to image_path(@image)
      end
    end
  end

  def destroy
    @image = Image.find(params[:image_id])
    @tag = @image.user_tags.find(params[:id])
    @tag.destroy
    flash[:notice] = "User untagged."
    redirect_to image_path(@image)
  end
end
