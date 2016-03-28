class SorceryCore < ActiveRecord::Migration
  def change
    create_table :spree/users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :spree/users, :email, unique: true
  end
end