require 'rails_helper'

RSpec.describe 'Products', type: :request do
  before(:all) do
    User.create(username: 'Jim')
    @user1 = User.find_by(username: 'Jim')
    @product1 = Product.create(name: 'HK Army SABR Paintball Gun', description: 'description1', price: 144.5,
                               image: 'https://images/1.jpg', owner: @user1)
  end
  describe 'GET api/v1/products' do
    it 'return http success' do
      get api_v1_products_path
      expect(response).to have_http_status(200)
    end

    it 'returns the value in the JSON response' do
      get api_v1_products_path
      json_response = JSON.parse(response.body)
      found_value = false
      json_response['products'].each do |product|
        if product['name'] == 'Hk army sabr paintball gun'
          found_value = true
          break
        end
      end
      expect(found_value).to be true
    end
  end

  describe 'GET api/v1/product/:id' do
    it 'return http success' do
      get api_v1_product_path(@product1.id)
      expect(response).to have_http_status(200)
    end

    it 'returns the value in the JSON response' do
      get api_v1_product_path(@product1.id)
      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq('HK Army SABR Paintball Gun')
    end
  end

  describe 'POST api/v1/products' do
    it 'return http success' do
      post '/api/v1/products', params: { product: {
        name: 'gun1',
        description: 'bla bla',
        price: 80,
        image: '1.jpg',
        owner_id: @user1.id
      } }
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
      expect(json_response['details']['name']).to eq('Gun1')
      expect(json_response['details']['price']).to eq('80.0')
    end
  end

  describe 'PUT api/v1/products' do
    it 'return http success' do
      put api_v1_product_path(@product1.id), params: { product: {
        name: 'Tippmann Cronus Paintball Gun'
      } }
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response['name']).to eq('Tippmann Cronus Paintball Gun')
    end
  end

  describe 'DESTROY api/v1/products' do
    it 'return http success' do
      delete api_v1_product_path(id: @product1.id, user_id: @user1.id)
      expect(response).to have_http_status(:success)
    end
  end
end
