class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.column :text, :string
      t.column :user_name, :string
      t.column :story_id, :integer

      t.timestamps
    end
  end
end
