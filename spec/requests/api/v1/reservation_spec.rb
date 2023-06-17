require 'rails_helper'

RSpec.describe 'Products', type: :request do
  before(:all) do
    @user1 = User.create(username: 'user1')
    @product1 = Product.create(name: 'HK Army SABR Paintball Gun', description: 'description1', price: 144.5,
                               image: 'https://images/1.jpg', owner: @user1)
    @reservation1 = Reservation.create(date: '2023-02-02', product: @product1, user: @user1)
  end
  describe 'GET api/v1/users/reservations' do
    it 'return http success' do
      get api_v1_user_reservations_path(@user1.id)
      expect(response).to have_http_status(200)
    end

    it 'returns the value in the JSON response' do
      get api_v1_user_reservations_path(@user1.id)
      json_response = JSON.parse(response.body)
      found_value = false
      json_response.each do |reservation|
        if reservation['date'] == '2023-02-02'
          found_value = true
          break
        end
      end
      expect(found_value).to be true
    end
  end

  describe 'GET api/v1/users/reservation/:id' do
    it 'return http success' do
      get api_v1_user_reservation_path(user_id: @user1.id, id: @reservation1.id)
      expect(response).to have_http_status(200)
    end

    it 'returns the value in the JSON response' do
      get api_v1_user_reservation_path(user_id: @user1.id, id: @reservation1.id)
      json_response = JSON.parse(response.body)
      expect(json_response['date']).to eq('2023-02-02')
    end
  end

  describe 'POST api/v1/users/reservations' do
    it 'return http success' do
      post api_v1_user_reservations_path(@user1.id), params: { reservation: {
        date: '2024-12-12',
        product_id: @product1.id,
        user_id: @user1.id
      } }
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:created)
      expect(json_response['details']['date']).to eq('2024-12-12')
    end
  end

  describe 'PUT api/v1/users/reservations' do
    it 'return http success' do
      put api_v1_user_reservation_path(user_id: @user1.id, id: @reservation1.id), params: { reservation: {
        date: '2023-05-04'
      } }
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response['date']).to eq('2023-05-04')
    end
  end

  describe 'DESTROY api/v1/users/reservation' do
    it 'return http success' do
      delete api_v1_user_reservation_path(user_id: @user1.id, id: @reservation1.id)
      expect(response).to have_http_status(:success)
    end
  end
end
