class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstname,  null: false, limit: 70
      t.string :lastname,  null: false, limit: 70
      t.string :email, null: false, limit: 255 

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
