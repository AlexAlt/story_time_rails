class UpdateStoriesImages < ActiveRecord::Migration
  def change
    add_column :stories, :image_id, :integer
  end
end
