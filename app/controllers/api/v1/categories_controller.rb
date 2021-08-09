class API::V1::CategoriesController < API::V1::APIController

  def index
    render json: Category.where(active: true).all
  end

  def show
    posts = load_category_post params[:id], params[:page]
    render json: posts, each_serializer: PostsSerializer
    set_pagination_headers posts
  end

  private 
    
    def load_category_post id, page_no
      Post.where(category_id: id).page(page_no)
    rescue
      render json: {errors: ["Post could not be found"]}, status: 404 
    end

end