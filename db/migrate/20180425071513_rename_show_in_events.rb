class RenameShowInEvents < ActiveRecord::Migration[5.2]
  def change
  	rename_column :events, :show, :active 
  	rename_column :groups, :show, :active
  end
end
