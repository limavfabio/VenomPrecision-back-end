class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :products, foreign_key: :owner_id, dependent: :destroy

  validates :username, presence: true, uniqueness: true
end
