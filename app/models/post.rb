# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  aasm_state :string
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
  mount_uploader :photo, PhotoUploader

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :photo, presence: true
  validate :photo_size

  include AASM
  aasm do
    state :moderated, initial: true
    state :approved
    state :banned
    state :deleted
    event :approve do
      transitions from: :moderated, to: :approved
      transitions from: :banned, to: :approved
    end

    event :ban do
      transitions from: :moderated, to: :banned
      transitions from: :approved, to: :banned
    end

    event :delete do
      transitions from: :moderated, to: :deleted
      transitions from: :approved, to: :deleted
      transitions from: :banned, to: :deleted
      transitions from: :deleted, to: :deleted
    end
    event :restore do
      transitions from: :deleted, to: :moderated
    end
  end

  def photo_size
    errors.add(:photo, 'should be less than 5MB') if photo.size >= 5.megabytes
  end
end
