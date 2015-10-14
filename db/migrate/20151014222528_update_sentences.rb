class UpdateSentences < ActiveRecord::Migration
  def change
    add_column :sentences, :image_id, :integer
  end
end
