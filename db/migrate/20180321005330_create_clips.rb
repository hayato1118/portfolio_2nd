class CreateClips < ActiveRecord::Migration[5.1]
  def change
    create_table :clips do |t|
   	  t.references :user, null:false
      t.references :topic, null:false
      t.timestamps
    end
  end
end
