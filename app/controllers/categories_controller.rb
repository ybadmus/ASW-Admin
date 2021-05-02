class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @invites = Category.where(id: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = category_params

    if @category.save
        return redirect_to root_path, notice: 'New category successfully created.'
    else
      flash.now[:alert] = @category.errors.full_messages.first
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end

end