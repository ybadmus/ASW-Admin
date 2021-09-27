# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = set_post params[:id]
  end

  # GET /posts/new
  def new
    @post = Post.new
    @categories = initialize_category
    @category_id = request.referer.last(1).to_i
  end

  # GET /posts/1/edit
  def edit
    @post = set_post params[:id]
    @categories = initialize_category
    @category_id = @post.category.id
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)
    @categories = initialize_category
    @category_id = @post.category.id

    respond_to do |format|
      if @post.save
        return redirect_to category_path(params[:post][:category_id]),
                           notice: 'Post was successfully created.'
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = set_post params[:id]
    @categories = initialize_category
    @category_id = @post.category.id

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = set_post params[:id]
    @post.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Post was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post post_id
    Post.find(post_id)
  rescue
    render json: {errors: ["Post could not be found"]}, status: 404 
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description, :story_image, :detail_media, :source, :user_id, :category_id,
                                 :image_detail_media)
  end

  def  
    categories = [['Select category', 0]]
    Category.all.each { |item| categories << [item.name, item.id] }
    categories
  end
end
