class AddsFieldsToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :email, :string
  	add_column :users, :link, :string
  	add_column :users, :tags, :string
  	add_column :users, :blogs, :text
  end

  def down
  	add_column :users, :email
  	add_column :users, :link
  	add_column :users, :tags
  	add_column :users, :blogs
  end
end
