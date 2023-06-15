class Package < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true

  has_many :package_products, dependent: :destroy
  has_many :products, through: :package_products
end
