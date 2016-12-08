class ReceiverInterest < ApplicationRecord
  # Direct associations

  belongs_to :interest

  belongs_to :receiver,
             :class_name => "GiftReceiver"

  # Indirect associations

  # Validations

end
