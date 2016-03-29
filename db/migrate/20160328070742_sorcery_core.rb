class SorceryCore < ActiveRecord::Migration
  def change
    create_table :spree_people do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :spree_people, :email, unique: true
  end
end
