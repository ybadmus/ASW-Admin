# frozen_string_literal: true

module ApplicationHelper
  def loadMenus
    @menus = Category.all
  end

  def back_button_path
    if @category_id.to_i > 0 
      category_path(@category_id)
    else
      categories_path
    end
  end
end
