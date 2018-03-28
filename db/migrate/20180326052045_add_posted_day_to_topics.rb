class AddPostedDayToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :posted_day, :string
  end
end
