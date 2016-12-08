class CreateGiftOccasions < ActiveRecord::Migration
  def change
    create_table :gift_occasions do |t|
      t.integer :occasion_type_id
      t.datetime :date
      t.integer :user_id
      t.integer :receiver_id
      t.float :budget

      t.timestamps

    end
  end
end
