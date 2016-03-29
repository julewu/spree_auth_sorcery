class AddSpreeFieldsToCustomUserTable < ActiveRecord::Migration
  def change
    add_column :spree_people, :spree_api_key, :string, :limit => 48
    add_column :spree_people, :ship_address_id, :integer
    add_column :spree_people, :bill_address_id, :integer
  end
end
