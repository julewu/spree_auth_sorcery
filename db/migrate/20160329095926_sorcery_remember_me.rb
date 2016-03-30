class SorceryRememberMe < ActiveRecord::Migration
  def change
    add_column :spree_people, :remember_me_token, :string, :default => nil
    add_column :spree_people, :remember_me_token_expires_at, :datetime, :default => nil

    add_index :spree_people, :remember_me_token
  end
end
