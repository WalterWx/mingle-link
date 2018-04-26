class AddCreatedBytoGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :created_by, :string
  end
end
