class Product < ApplicationRecord
  validates :name, :image, :price, presence: true
  validates :price, numericality: { only_float: true, greater_than_or_equal_to: 0 }

  belongs_to :owner, class_name: 'User'
  has_many :reservations, dependent: :destroy
end
