class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end 
  
  def destroy
    topic_id = params[:topic_id]
    @favorite = Favorite.find_by(user_id: current_user.id, topic_id: topic_id)
    @favorite.destroy
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end
end