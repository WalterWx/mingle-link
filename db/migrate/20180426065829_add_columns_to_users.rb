class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :string
    add_column :users, :public_profile_url, :string
    add_column :users, :image, :string
    add_column :users, :provider, :string
    add_column :users, :token, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :string
  end
end
