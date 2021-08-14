# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @posts = Post.where(category_id: params[:id]).includes(:user, :category)
    @category_name = Category.find(params[:id]).name
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path, notice: 'New category successfully created.'
    else
      flash.now[:alert] = @category.errors.full_messages.first
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
