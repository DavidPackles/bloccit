class CommentsController < ApplicationController
  respond_to :html, :js

  def create

    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comments = @post.comments

    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was saved, you opinionated bastard."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving your comment. Please try again"
      redirect_to [@topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was deleted successfully"
    else
      flash[:error] = "Comment could not be deleted. Try again."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
