class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :unique_code
      t.string :description

      t.timestamps
    end
  end
end
