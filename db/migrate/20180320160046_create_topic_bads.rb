class CreateTopicBads < ActiveRecord::Migration[5.1]
  def change
    create_table :topic_bads do |t|
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
