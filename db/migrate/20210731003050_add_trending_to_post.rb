# frozen_string_literal: true

class AddTrendingToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :trending, :boolean, default: false
  end
end
