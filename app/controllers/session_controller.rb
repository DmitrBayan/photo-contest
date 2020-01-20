# frozen_string_literal: true

class SessionController < ApplicationController
  def create
    #@user = User.from_omniauth(request.env['omniauth.auth'])
    @user = Interactions::User::Auth.run(request.env['auth_hash'])
    session[:user_id] = @user.id
    if !@user.nil?
      flash[:success] = "Welcome, #{@user.first_name}!"
      redirect_to view_path
    else
      flash[:warning] = 'Unknown error'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
