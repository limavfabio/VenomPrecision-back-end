class Product < ApplicationRecord
  validates :name, :description, presence: true

  belongs_to :owner, class_name: 'User'
  has_many :reservations
end
