class AddGoodCountToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :good_count, :integer, :default => 0
  end
end
