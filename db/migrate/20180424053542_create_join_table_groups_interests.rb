class CreateJoinTableGroupsInterests < ActiveRecord::Migration[5.2]
  def change
    create_join_table :groups, :interests do |t|
      t.index [:group_id, :interest_id]
      t.index [:interest_id, :group_id]
    end
  end
end
