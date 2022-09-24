class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment saved successfully"
      redirect_to user_post_path(current_user, @comment.post)
    else
      flash.now[:error] = "Error: Post could not be saved"
      render :new
    end
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:text)
      .merge(author: current_user, post_id: params.require(:post_id))
  end
end
