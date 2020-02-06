# frozen_string_literal: true

class User < ApplicationRecord
  validates :access_token, :uid, :provider, presence: true
end
