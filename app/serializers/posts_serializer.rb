# frozen_string_literal: true

class PostsSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :description, :date, :category,
             def category
               object.category.name
             end

  def image
    object.story_image
  end

  def description
    object.description.slice(0...200)
  end

  def date
    "#{object.updated_at.strftime('%F')} #{object.updated_at.strftime('%I:%M %p')}"
  end
end
