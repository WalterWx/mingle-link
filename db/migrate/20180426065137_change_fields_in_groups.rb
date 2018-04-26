class ChangeFieldsInGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :event, index: true
    add_reference :groups, :user, index: true
    add_column :groups, :title, :string

  end
end
