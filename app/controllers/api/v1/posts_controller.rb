class API::V1::PostsController < ActionController::API

  def index
    @posts = Post.includes(:user).all
    render json: @posts
  end

  def show
    @post = set_post params[:id]
    render json:  @post, serializer: PostSerializer
  end

  private 

    def set_post id
      Post.find(id)
    rescue
      render json: {errors: ["Post could not be found"]}, status: 404 
    end

end
