class CreateGiftRecommendations < ActiveRecord::Migration
  def change
    create_table :gift_recommendations do |t|
      t.string :gift
      t.string :cost
      t.string :url
      t.integer :occasion_id
      t.boolean :selected
      t.integer :rating
      t.integer :recommender_id
      t.string :description

      t.timestamps

    end
  end
end
