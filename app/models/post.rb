# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 5..120 }
  validates :description, presence: true
  validates :story_image, presence: true
  validates :source, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :image_detail_media, presence: false

  belongs_to :user
  belongs_to :category

  def related_stories
    stories = category.posts.where(category_id: category_id).reject{ |n| n === self }
    stories.take(6)
  end
end
