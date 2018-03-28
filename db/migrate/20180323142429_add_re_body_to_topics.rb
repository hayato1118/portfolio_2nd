class AddReBodyToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :re_body, :text
  end
end
