json.extract! post, :id, :title, :description, :story_image, :detail_media, :source, :posted_by, :category_id, :image_detail_media, :created_at, :updated_at
json.url post_url(post, format: :json)
