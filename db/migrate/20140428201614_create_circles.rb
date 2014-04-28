class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
    add_index :circles, :owner_id
  end
end
