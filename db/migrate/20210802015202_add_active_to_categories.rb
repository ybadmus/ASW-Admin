# frozen_string_literal: true

class AddActiveToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :active, :boolean, default: true
  end
end
