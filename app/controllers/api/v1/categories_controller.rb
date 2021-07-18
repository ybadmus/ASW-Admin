class API::V1::CategoriesController < ApplicationController

  def index
    render json: Category.all
  end

  def show
    category = set_post params[:id]
    render json: category
  end

  private 
    
    def set_post id
      Category.find(id)
    rescue
      render json: {errors: ["Post could not be found"]}, status: 404 
    end
end