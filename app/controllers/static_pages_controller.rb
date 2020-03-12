class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @micropost = current_user.posts.build if logged?
  end
end
