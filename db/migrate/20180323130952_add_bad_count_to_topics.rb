class AddBadCountToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :bad_count, :integer, :default => 0
  end
end
