class AddArchivedToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :archived, :boolean
  end
end
