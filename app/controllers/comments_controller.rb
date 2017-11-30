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

  end

  def update

  end

  def destroy

  end
private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
