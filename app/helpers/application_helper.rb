module ApplicationHelper
  def loadMenus
    @menus = Category.all
  end
end
