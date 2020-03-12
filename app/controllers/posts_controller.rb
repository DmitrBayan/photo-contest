# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged?, only: %i[create destroy]
  def create
    @post = current_user.post.build(post_params)
    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to root_path
    else
      flash[:warning] = 'Something wrong...'
    end
  end

  def destroy; end

  private

  def post_params
    params.require(:posts).permit(:content)
  end
end
