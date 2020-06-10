# frozen_string_literal: true
class AddPhotoToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :photo, :string
  end
end
