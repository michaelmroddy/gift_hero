class CreateReviewComments < ActiveRecord::Migration
  def change
    create_table :review_comments do |t|
      t.integer :recommendation_id
      t.string :comment

      t.timestamps

    end
  end
end
