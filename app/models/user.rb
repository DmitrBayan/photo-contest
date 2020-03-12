# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  validates :access_token, :uid, :provider, presence: true
end
