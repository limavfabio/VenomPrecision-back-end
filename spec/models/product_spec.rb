require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is invalid without name' do
    product = Product.new()
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without image' do
    product = Product.new(name: 'Gun 1')
    product.valid?
    expect(product.errors[:image]).to include("can't be blank")
  end

  it 'is invalid without price' do
    product = Product.new(name: 'Gun 1', image: 'https://urlpicture.com')
    product.valid?
    expect(product.errors[:price]).to include("can't be blank")
  end

  it 'is invalid with prices lower than 0' do
    product = Product.new(name: 'Gun 1', image: 'https://urlpicture.com', price: -1)
    product.valid?
    expect(product.errors[:price]).to include("must be greater than or equal to 0")
  end

  it 'is invalid without owner' do
    product = Product.new(name: 'Gun 1', image: 'https://urlpicture.com', price: 27.20)
    product.valid?
    expect(product.errors[:owner]).to include("must exist")
  end

  it 'should be stored in DB' do
    user = User.create(username: 'andercm')
    product = Product.create(name: 'Gun 1', image: 'https://urlpicture.com', price: 27.20, owner: user)

    expect(product.persisted?).to eq(true)
  end
end