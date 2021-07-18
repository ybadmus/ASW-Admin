class API::V1::PostsController < ActionController::API

  def index
    posts = load_posts params[:category_id]
    render json: posts, each_serializer: PostsSerializer
  end

  def show
    post = set_post params[:id]
    render json: post, serializer: PostSerializer
  end

  private 

    def set_post id
      Post.includes(:user, :category).find(id)
    rescue
      render json: {errors: ["Post could not be found"]}, status: 404 
    end

    def load_posts category_id
      if category_id.nil?
        Post.includes(:user).all 
      else
        Post.where(category_id: params[:category_id])
      end
    end

end
