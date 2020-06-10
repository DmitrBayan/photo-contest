# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :logged?, only: %i[create destroy]
  before_action :correct_user, only: :destroy
  before_action :find_commentable, only: :create

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Commented!'
      redirect_to request.referrer
    else
      redirect_to request.referrer || root_path
      flash[:warning] = @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_to request.referrer || current_user
  end

  private

  def correct_user
    @comment = current_user.posts.comments.find(params[:id])
    redirect_to root_path if @comment.blank?
    flash[:warning] = 'It is not your comment'
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find(params[:format]) if params[:format]
    @commentable = Post.find(params[:post_id]) if params[:post_id]
  end
end
