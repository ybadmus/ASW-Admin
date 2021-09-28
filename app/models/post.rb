# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order(updated_at: :desc) }
  # default_scope { where(active: true) }

  has_rich_text :description

  validates :title, :story_image, :source, :user_id, :category_id, :image_detail_media, presence: true

  belongs_to :user
  belongs_to :category

  def related_stories
    category.posts.order('RANDOM()').reject { |n| n === self }.take(6)
  end

  def next
    return self.class.unscoped.first if self === self.class.unscoped.last

    self.class.where('id > ?', id).first
  end

  def previous
    return self.class.unscoped.last if self === self.class.unscoped.first

    self.class.where('id < ?', id).last
  end
end
