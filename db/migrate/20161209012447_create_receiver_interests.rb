class CreateReceiverInterests < ActiveRecord::Migration
  def change
    create_table :receiver_interests do |t|
      t.integer :interest_id
      t.integer :receiver_id

      t.timestamps

    end
  end
end
