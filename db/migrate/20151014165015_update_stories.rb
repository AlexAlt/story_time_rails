class UpdateStories < ActiveRecord::Migration
  def change
    add_column :stories, :sentence_id, :integer
  end
end
