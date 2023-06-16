class User < ApplicationRecord
  has_many :reservations
  has_many :products, foreign_key: :owner_id

  validates :username, presence: true
end
