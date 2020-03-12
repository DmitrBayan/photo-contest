# frozen_string_literal: true

module ApplicationHelper
  def full_title(title = '')
    full_title = 'PhotoContest'
    full_title = title + ' *' + full_title + '*' unless title.nil?
  end

  def logged?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end
end
