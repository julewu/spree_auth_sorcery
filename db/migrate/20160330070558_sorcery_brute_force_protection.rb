class SorceryBruteForceProtection < ActiveRecord::Migration
  def change
    add_column :spree_people, :failed_logins_count, :integer, :default => 0
    add_column :spree_people, :lock_expires_at, :datetime, :default => nil
    add_column :spree_people, :unlock_token, :string, :default => nil

    add_index :spree_people, :unlock_token
  end
end
