class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :topic_image_id
      t.text :body
      t.integer :user_id
      t.string :url

      t.timestamps
    end
  end
end
