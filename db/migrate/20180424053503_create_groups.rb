class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :description
      t.string :creator
    end

    add_reference :groups, :event, foreign_key: true
  end
end
