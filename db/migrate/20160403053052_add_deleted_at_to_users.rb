class AddDeletedAtToUsers < ActiveRecord::Migration
  def change
    add_column :spree_people, :deleted_at, :datetime
    add_index :spree_people, :deleted_at
  end
end
