class AddRejectedToGiftRecommendations < ActiveRecord::Migration[5.0]
  def change
    add_column :gift_recommendations, :rejected, :boolean
  end
end
