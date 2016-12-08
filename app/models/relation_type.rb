class RelationType < ApplicationRecord
  # Direct associations

  has_many   :gift_receivers,
             :foreign_key => "relation_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
