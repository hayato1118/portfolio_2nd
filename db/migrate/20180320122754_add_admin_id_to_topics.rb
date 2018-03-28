class AddAdminIdToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :admin_id, :integer
  end
end
