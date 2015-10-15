class UpdateTables < ActiveRecord::Migration
  def change
    remove_column :stories, :sentence_id, :integer
    remove_column :stories, :image_id, :integer
    remove_column :images, :sentence_id, :integer
    remove_column :sentences, :story_id, :integer
  end
end
