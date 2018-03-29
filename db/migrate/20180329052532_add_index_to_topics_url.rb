class AddIndexToTopicsUrl < ActiveRecord::Migration[5.1]
  def change
  	add_index :topics, :url, unique: true
  end
end
