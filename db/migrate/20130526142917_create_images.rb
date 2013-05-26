class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.string :filename
    	t.string :content_type
    	t.binary :data
    	t.integer :user_id

     	t.timestamps
    end
  end
end
