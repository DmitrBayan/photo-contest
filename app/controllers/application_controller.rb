# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  rescue_from ActiveRecord::RecordNotFound, with: -> { error_404 }

  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
