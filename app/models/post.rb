# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  photo      :string
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id                 (user_id)
#  index_posts_on_user_id_and_created_at  (user_id,created_at)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :photo, PhotoUploader
  validates :user_id, presence: true
  validates :title, presence: true
  validates :photo, presence: true
  validate :photo_size
  has_many :comments, as: :commentable, dependent: :destroy

  def photo_size
    if photo.size >= 5.megabytes
      errors.add(:photo, 'should be less than 5MB')
    end
  end
end
