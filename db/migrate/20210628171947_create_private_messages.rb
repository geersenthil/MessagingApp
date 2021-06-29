class CreatePrivateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :private_messages do |t|
      t.string :directmessage
      t.integer :sender_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
