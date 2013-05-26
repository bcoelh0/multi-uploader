class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :tumblr_name
    	t.string :captation
    	t.timestamps
    end
  end
end
