class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :chattext
      t.integer :sender_id
      t.timestamps
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
