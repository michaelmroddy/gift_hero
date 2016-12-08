class GiftOccasionType < ApplicationRecord
  # Direct associations

  has_many   :gift_occasions,
             :foreign_key => "occasion_type_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
