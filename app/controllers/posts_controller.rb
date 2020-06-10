# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged?, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def index
    @posts = Post.page(params[:page]).approved.reorder(params[:sorting])
    @posts = Post.page(params[:page]).approved unless params[:sorting].present?
  end

  def show
    @post = Post.find_by(id: params[:post_id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to current_user
    else
      redirect_to request.referrer || root_path
      flash[:warning] = @post.errors.full_messages.to_sentence
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to request.referrer || current_user
  end

  private

  def post_params
    params.require(:post).permit(:title, :photo)
  end

  def correct_user
    @post = current_user.posts.find(params[:id])
    redirect_to root_path if @post.blank?
  end
end
