class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :posted_by, :story_image, :detail_media, :category_name, :source, :detail_media_type, :created_at, :updated_at

  def posted_by
    object.user.username
  end

  def category_name
    object.category.name
  end

  def detail_media_type
    object.image_detail_media
  end
end
