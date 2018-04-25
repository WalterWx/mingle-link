class FixColumnName < ActiveRecord::Migration[5.2]
  
  def change
  	change_table :events do |t|
  	t.rename :name, :title
  	t.rename :unique_code, :event_id
  end
end
end
