class API::V1::PostsController < API::V1::APIController

  def index
    posts = load_posts params[:category_id], params[:page] || 1
    render json: posts, each_serializer: PostsSerializer
    set_pagination_headers posts
  end

  def show
    post = set_post params[:id]
    render json: post, serializer: PostSerializer
  end

  def top_news
    top_news = load_top_news
    render json: top_news, each_serializer: PostsSerializer
  end

  private 

    def set_post id
      Post.includes(:user, :category).find(id)
    rescue
      render json: {errors: ["Post could not be found"]}, status: 404 
    end

    def load_posts category_id, page_no
      if category_id.nil?
        Post.includes(:user).page(page_no) 
      else
        Post.where(category_id: category_id).page(page_no)
      end
    end

    def load_top_news
      Post.where(category_id: Category.find_by(name: "Top News").id).limit(8)
    end

end
