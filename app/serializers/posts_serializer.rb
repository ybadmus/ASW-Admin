class PostsSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :description, :date, :posted_by,

  def posted_by
    object.user.username
  end

  def image
    object.story_image
  end

  def description
    object.description.slice(0...250)
  end

  def date
    object.updated_at
  end

end
