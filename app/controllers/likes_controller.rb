class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to @post, notice: 'Liked successfully.'
    else
      redirect_to @post, alert: 'Unable to like post.'
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)

    if @like&.destroy
      redirect_to @post, notice: 'Unliked successfully.'
    else
      redirect_to @post, alert: 'Unable to unlike post.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
