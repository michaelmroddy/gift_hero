class User < ApplicationRecord
  # Direct associations

  belongs_to :role

  has_many   :gift_recommendations,
             :foreign_key => "recommender_id",
             :dependent => :destroy

  has_many   :gift_receivers,
             :dependent => :destroy

  has_many   :gift_occasions,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
