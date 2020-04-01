# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :logged?, only: %i[create destroy], except: [:must_logged]
  before_action :correct_user, only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body))
    if @comment.save
      flash.now[:success] = 'Commented!'
    else
      redirect_to root_path
      flash.now[:warning] = 'Something went wrong...'
    end
  end

  private


  def correct_user
    @comment = current_user.posts.comments.find(params[:id])
    redirect_to root_path if @comment.nil?
    flash[:warning] = 'It is not your comment'
  end
end
