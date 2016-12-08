class ReviewComment < ApplicationRecord
  # Direct associations

  belongs_to :recommendation,
             :class_name => "GiftRecommendation"

  # Indirect associations

  # Validations

end
