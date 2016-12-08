class Interest < ApplicationRecord
  # Direct associations

  has_many   :receiver_interests,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
