# frozen_string_literal: true

class SessionController < ApplicationController
  def create
    outcome = ::Users::Auth.run(auth_hash: request.env['omniauth.auth'].to_h)
    @user = outcome.valid? ? outcome.result : nil
    if @user.present?
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.first_name}!"
      redirect_to view_path
    else
      flash[:warning] = 'outcome errors...'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
