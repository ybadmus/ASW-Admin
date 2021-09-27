# frozen_string_literal: true

module API
  module V1
    class PostsController < API::V1::APIController
      def index
        posts = load_posts params[:category_id], params[:page], params[:pageSize]
        render json: posts, each_serializer: PostsSerializer
        set_pagination_headers posts
      end

      def show
        post = set_post params[:id]
        render json: post, serializer: PostSerializer
      end

      def top_news
        top_news = load_top_news params[:page], params[:pageSize]
        render json: top_news, each_serializer: PostsSerializer
      end

      def latest_news
        news = load_latest_news params[:page], params[:pageSize]
        render json: news, each_serializer: PostsSerializer
        set_pagination_headers news
      end

      def entertainment_news
        news = load_entertainment_news params[:page], params[:pageSize]
        render json: news, each_serializer: PostsSerializer
        set_pagination_headers news
      end

      def trending
        trending = load_trending params[:page], params[:pageSize]
        render json: trending, each_serializer: PostsSerializer
      end

      private

      def set_post(id)
        Post.includes(:user, :category).find(id)
      rescue StandardError
        render json: { errors: ['Post could not be found'] }, status: 404
      end

      def load_posts(category_id, page_no, page_size)
        if category_id.nil?
          Post.where(active: true).includes(:user, :category).page(page_no).per(page_size)
        else
          Post.where(active: true).includes(:user,
                                            :category).where(category_id: category_id).page(page_no).per(page_size)
        end
      end

      def load_latest_news(page_no, page_size)
        Post.where(active: true).where(category_id: Category.find_by(name: 'Latest News').id).includes(:user,
                                                                                                       :category).page(page_no).per(page_size)
      end

      def load_entertainment_news(page_no, page_size)
        Post.where(category_id: Category.find_by(name: 'Entertainment').id).includes(:user,
                                                                                     :category).page(page_no).per(page_size)
      end

      def load_top_news(page_no, page_size)
        Post.where(category_id: Category.find_by(name: 'Top News').id).includes(:user,
                                                                                :category).page(page_no).per(page_size)
      end

      def load_trending(page_no, page_size)
        # Add date constraint here ..
        Post.where(trending: true).page(page_no).per(page_size)
      end
    end
  end
end
