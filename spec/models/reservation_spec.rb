require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it 'is invalid without date' do
    reservation = Reservation.new
    reservation.valid?
    expect(reservation.errors[:date]).to include("can't be blank")
  end

  it 'is invalid without user' do
    reservation = Reservation.new(date: '2023-06-16')
    reservation.valid?
    expect(reservation.errors[:user]).to include('must exist')
  end

  it 'is invalid without product' do
    user = User.create(username: 'andercm')
    reservation = Reservation.new(date: '2023-06-16', user:)
    reservation.valid?
    expect(reservation.errors[:product]).to include('must exist')
  end

  it 'should be stored in DB' do
    user = User.create(username: 'andercm')
    product = Product.create(name: 'Gun 1', image: 'https://urlpicture.com', price: 27.20, owner: user)

    reservation = Reservation.create(date: '2023-06-16', user:, product:)

    expect(reservation.persisted?).to eq(true)
  end
end
