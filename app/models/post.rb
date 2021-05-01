class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 5..200 }
  validates :description, presence: true
  validates :story_image, presence: true
  validates :source, presence: false
  validates :posted_by, presence: true
  validates :category_id, presence: true
  validates :image_detail_media, presence: true

  scope :related_stories, -> { Post.where('category_id', :category_id).limit(10) }
  scope :total_no_posts, -> { Post.all.count }

  belongs_to :user
  belongs_to :category
end
