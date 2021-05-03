class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 5..120 }
  validates :description, presence: true
  validates :story_image, presence: true
  validates :source, presence: false
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :image_detail_media, presence: false

  scope :related_stories, -> { Post.where('category_id', :category_id).limit(10) }
  scope :total_no_posts, -> { Post.all.count }

  belongs_to :user
  belongs_to :category
end
