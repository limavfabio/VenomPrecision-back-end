class Reservation < ApplicationRecord
  validates :date, :city, presence: true

  belongs_to :user
  belongs_to :product
end
