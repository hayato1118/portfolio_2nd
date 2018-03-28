class AddPageCountToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :page_count, :integer, :default => 0
  end
end
