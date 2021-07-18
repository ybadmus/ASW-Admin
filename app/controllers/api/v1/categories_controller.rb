class CategoriesController < ApplicationController

  def index
    render json: Category.all
  end

  def show
    category = set_post params[:id]
    render json: category
  end

  private 
    
    def set_post id
      Category.find(id).includes(:posts)
    rescue
      render json: {errors: ["Post could not be found"]}, status: 404 
    end
end