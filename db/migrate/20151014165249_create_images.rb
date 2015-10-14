class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.column :image, :string
      t.column :sentence_id, :integer
      t.column :story_id, :integer

      t.timestamps
    end
  end
end
