class AddParagraphToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :paragraph, :text
  end
end
