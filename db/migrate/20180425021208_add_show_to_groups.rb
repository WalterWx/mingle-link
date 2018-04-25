class AddShowToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :show, :boolean
  end
end
