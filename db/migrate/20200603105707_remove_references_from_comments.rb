# frozen_string_literal: true

class RemoveReferencesFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :post, null: false, foreign_key: true
  end
end
