# frozen_string_literal: true

module ApplicationHelper
  def loadMenus
    @menus = Category.all
  end
end
