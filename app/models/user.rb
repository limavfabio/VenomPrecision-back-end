class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :reservations, dependent: :destroy
  has_many :products, foreign_key: :owner_id, dependent: :destroy

end
