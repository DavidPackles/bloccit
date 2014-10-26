class PostsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create]

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comments = @post.comments.paginate(page: params[:page], per_page: 5)
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post
    if @post.save_with_initial_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving this post. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post, :destroy?
    if @post.destroy
      flash[:notice] = "Post was deleted successfully."
      redirect_to @topic
     else
       flash[:error] = "There was an error deleting the post."
       render :show
     end      
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
