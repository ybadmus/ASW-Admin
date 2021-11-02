# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order(updated_at: :desc) }
  before_validation :description_in_both_columns, on: [:create, :update]

  has_rich_text :description

  validates :title, :story_image, :source, :user_id, :category_id, :description, :description_sm, presence: true

  belongs_to :user
  belongs_to :category

  private

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

    def description_in_both_columns
      self.description = description_sm unless description.present?
      self.description_sm = description unless description_sm.present?
    end
end
