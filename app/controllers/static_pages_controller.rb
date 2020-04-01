# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @post = current_user.posts.build if logged?
  end
end
