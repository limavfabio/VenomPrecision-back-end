require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without username' do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'should be stored in DB' do
    user = User.create(username: 'andercm')
    expect(user.persisted?).to eq(true)
  end
end
