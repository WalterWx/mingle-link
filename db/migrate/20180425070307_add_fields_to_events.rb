class AddFieldsToEvents < ActiveRecord::Migration[5.2]
  
  def change
  	add_column :events, :datetime_start, :date
  	add_column :events, :datetime_end, :date
  	add_column :events, :location, :string
  end
end
