class API::V1::PostsController < ActionController::API

  def index
    posts = load_posts params[:category_id], params[:page] || 1
    render json: posts, each_serializer: PostsSerializer
    set_pagination_headers posts
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

    def load_posts category_id, page_no
      if category_id.nil?
        Post.includes(:user).page(page_no) 
      else
        Post.where(category_id: category_id).page(page_no)
      end
    end

    def set_pagination_headers(pc)
      headers["X-Total-Count"] = pc.total_count
  
      links = []
      links << page_link(1, "first") unless pc.first_page?
      links << page_link(pc.prev_page, "prev") if pc.prev_page
      links << page_link(pc.next_page, "next") if pc.next_page
      links << page_link(pc.total_pages, "last") unless pc.last_page?
      headers["Link"] = links.join(", ") if links.present?
    end
  
    def page_link(page, rel)
      base_uri = request.url.split("?").first
      "<#{base_uri}?#{request.query_parameters.merge(page: page).to_param}>; rel='#{rel}'"
    end

end
