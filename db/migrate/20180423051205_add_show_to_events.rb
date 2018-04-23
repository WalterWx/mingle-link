class AddShowToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :show, :boolean
  end
end
