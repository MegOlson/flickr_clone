class CommentsController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment posted!"
    else
      flash[:alert] = "Something went wrong!"
    end
    redirect_to image_path(@image)
  end

  def edit
    @image = Image.find(params[:image_id])
    @categories = Category.all
    @category = Category.first
    @users = User.all
    @comment = @image.comments.find(params[:id])
    if @comment.user == current_user
      render template: "images/show"
    else
      flash[:alert] = "You aren't authorized to do that."
      redirect_to image_path(@image)
    end
  end

  def update
    @image = Image.find(params[:image_id])
    @comment = @image.comments.find(params[:id])
    if @comment.user == current_user
      if @comment.update(comment_params)
        flash[:notice] = "Comment updated!"
      else
        flash[:alert] = "Something went wrong!"
      end
    else
      flash[:alert] = "You aren't authorized to do that."
    end
    redirect_to image_path(@image)
  end

  def destroy

  end
private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
