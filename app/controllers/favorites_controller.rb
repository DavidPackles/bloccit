class FavoritesController < ApplicationController
  def create

    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    if favorite.save
      flash[:notice] = "You favorited this post! Good Stuff!"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error favoriting your post. Please try again."
      redirect_to [@post.topic, @post]
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorited(@post)
    if favorite.destroy
      flash[:notice] = "Favorite was removed"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error unfavoriting"
      redirect_to [@post.topic, @post]
    end
  end

end
