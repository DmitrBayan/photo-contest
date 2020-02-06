# frozen_string_literal: true

class UsersController < ApplicationController
  def login
    @user = User.new
  end

  def view
    @user = User.find_by(params[:user_id])
  end
end
