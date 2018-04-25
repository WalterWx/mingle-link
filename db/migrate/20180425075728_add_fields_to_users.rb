class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :expires_at, :int
    add_column :users, :token, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :string
    add_column :users, :publicProfileUrl, :string     
    add_column :users, :location, :string
    add_column :users, :image, :string
  end
end
