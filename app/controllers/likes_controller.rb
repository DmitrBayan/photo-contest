# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like

  def create
    if already_liked?
      @like.destroy
      flash[:success] = 'Unliked!'
    else
      @post.likes.create(user_id: current_user.id)
      flash[:success] = 'Liked!'
    end
    redirect_to request.referrer || root_path
  end

  def destroy; end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def find_like
    @like = @post.likes.find_by(params[:id])
  end
end
