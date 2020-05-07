# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :logged?, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to root_path
  end


  private

  def correct_user
    @comment = current_user.posts.comments.find(params[:id])
    redirect_to root_path if @comment.nil?
    flash[:warning] = 'It is not your comment'
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
