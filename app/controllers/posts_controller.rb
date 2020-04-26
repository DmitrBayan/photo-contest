# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged?, only: %i[create destroy], except: [:must_logged]
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to current_user
    else
      redirect_to root_path
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
    params.require(:post).permit(:content, :photo)
  end

  def correct_user
    @post = current_user.posts.find(params[:id])
    redirect_to root_path if @post.nil?
    flash[:warning] = 'It is not your post'
  end
end
