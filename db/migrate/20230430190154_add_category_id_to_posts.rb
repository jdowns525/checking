class AddCategoryIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :category_id, :bigint
  end
end
