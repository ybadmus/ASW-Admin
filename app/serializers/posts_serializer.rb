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
   object.description.to_plain_text.slice(0...250)
  end

  def date
    "#{object.updated_at.strftime("%d/%m/%Y")} #{object.updated_at.strftime('%I:%M %p')}"
  end
end
