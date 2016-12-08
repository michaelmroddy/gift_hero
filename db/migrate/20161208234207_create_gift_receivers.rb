class CreateGiftReceivers < ActiveRecord::Migration
  def change
    create_table :gift_receivers do |t|
      t.string :name
      t.integer :relation_id
      t.integer :user_id
      t.boolean :male
      t.integer :age
      t.string :address
      t.date :birthday
      t.date :anniversary

      t.timestamps

    end
  end
end
