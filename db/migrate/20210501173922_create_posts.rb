# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :story_image
      t.string :detail_media
      t.string :source
      t.integer :user_id
      t.integer :category_id
      t.boolean :image_detail_media

      t.timestamps
    end
  end
end
