class AddPostSharesJoinTable < ActiveRecord::Migration
  def change
    create_table :post_shares do |t|
      t.integer :post_id
      t.integer :circle_id

      t.timestamps
    end
    add_index :post_shares, :post_id
    add_index :post_shares, :circle_id
  end
end
