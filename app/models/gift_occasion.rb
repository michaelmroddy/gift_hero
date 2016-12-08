class GiftOccasion < ApplicationRecord
  # Direct associations

  belongs_to :occasion_type,
             :class_name => "GiftOccasionType"

  has_many   :gift_recommendations,
             :foreign_key => "occasion_id",
             :dependent => :destroy

  belongs_to :receiver,
             :class_name => "GiftReceiver"

  belongs_to :user

  # Indirect associations

  # Validations

end
