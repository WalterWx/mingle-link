class RemoveFieldsFromEvents < ActiveRecord::Migration[5.2]
  def change
  	remove_column :events, :date
  	remove_column :events, :created_at
  	remove_column :events, :updated_at
  end
end
