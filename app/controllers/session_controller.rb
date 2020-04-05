# frozen_string_literal: true

class SessionController < ApplicationController
  def create
    outcome = ::Users::Auth.run(auth_hash: request.env['omniauth.auth'].to_h)
    if outcome.valid?
      @user = outcome.result
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.first_name}!"
      redirect_to @user
    else
      redirect_to root_path
      flash[:warning] = outcome.errors.full_messages
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
