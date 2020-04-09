# frozen_string_literal: true

module ApplicationHelper
  def full_title(title = '')
    full_title = 'PhotoContest'
    full_title = "#{title} * #{full_title} * " unless title.blank?
  end

  def logged?
    current_user.present?
  end

  def current_user?(user)
    user == current_user
  end

  def must_logged
    redirect_to root_path
    flash[:warning] = 'You must be logged in!'
  end
end
