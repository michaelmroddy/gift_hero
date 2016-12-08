class GiftReceiver < ApplicationRecord
  # Direct associations

  belongs_to :relation,
             :class_name => "RelationType"

  has_many   :gift_occasions,
             :foreign_key => "receiver_id",
             :dependent => :destroy

  has_many   :receiver_interests,
             :foreign_key => "receiver_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
