class AddCircleMembershipsJoinTable < ActiveRecord::Migration
  def change
    create_table :circle_memberships do |t|
      t.integer :circle_id
      t.integer :user_id

      t.timestamps
    end
    add_index :circle_memberships, :circle_id
    add_index :circle_memberships, :user_id
  end
end
