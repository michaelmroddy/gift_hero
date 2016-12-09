class GiftOccasion < ApplicationRecord
  # Direct associations

  belongs_to :occasion_type,
             :class_name => "GiftOccasionType"

  has_many   :gift_recommendations,
             :foreign_key => "occasion_id",
             :dependent => :destroy

  has_many   :approved_gift_recommendations,-> { where(selected: true) },
             :class_name => "GiftRecommendation",
             :foreign_key => "occasion_id"


  belongs_to :receiver,
             :class_name => "GiftReceiver"

  belongs_to :user

  def total_cost
    self.approved_gift_recommendations.sum(:cost)
  end

  # Indirect associations

  # Validations

end
