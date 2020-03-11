# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(params[:user_id])
    (flash[:warning] = 'User not found') && redirect_to(root_path) if @user.nil?
  end

  def index
    @users = User.paginate(page: params[:page])
  end
end
