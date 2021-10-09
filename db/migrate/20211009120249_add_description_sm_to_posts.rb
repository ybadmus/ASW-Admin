class AddDescriptionSmToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :description_sm, :text
  end
end
