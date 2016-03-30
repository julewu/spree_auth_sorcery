class SorceryActivityLogging < ActiveRecord::Migration
  def change
    add_column :spree_people, :last_login_at,     :datetime, :default => nil
    add_column :spree_people, :last_logout_at,    :datetime, :default => nil
    add_column :spree_people, :last_activity_at,  :datetime, :default => nil
    add_column :spree_people, :last_login_from_ip_address, :string, :default => nil

    add_index :spree_people, [:last_logout_at, :last_activity_at]
  end
end
