class AddAuthorToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :author, :string
  end
end
