class CreateTopicCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :topic_categories do |t|
      t.integer :category_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
