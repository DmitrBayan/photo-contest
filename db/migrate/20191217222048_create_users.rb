# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :access_token, null: false
      t.string :uid, null: false
      t.string :first_name
      t.string :last_name
      t.string :image_url
      t.string :url
      t.string :provider, null: false

      t.timestamps null: false
    end
  end
end
