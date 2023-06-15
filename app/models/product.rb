class Product < ApplicationRecord
  validates :name, presence: true

  has_many :package_products, dependent: :destroy
  has_many :packages, through: :package_products
end
