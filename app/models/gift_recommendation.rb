class GiftRecommendation < ApplicationRecord
  # Direct associations

  belongs_to :recommender

  has_many   :review_comments,
             :foreign_key => "recommendation_id",
             :dependent => :destroy

  belongs_to :occasion,
             :class_name => "GiftOccasion"

  # Indirect associations

  # Validations

  validates :rating, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }

end
