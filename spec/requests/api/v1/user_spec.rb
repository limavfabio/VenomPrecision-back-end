require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    @user1 = User.create(username: 'user1')
  end

  describe 'GET api/v1/users' do
    it 'return http success' do
      get api_v1_users_path
      expect(response).to have_http_status(200)
    end

    it 'returns the value in the JSON response' do
      get api_v1_users_path
      json_response = JSON.parse(response.body)
      found_value = false
      json_response.each do |user|
        if user['username'] == 'user1'
          found_value = true
          break
        end
      end
      expect(found_value).to be true
    end
  end

  describe 'GET api/v1/users/:id' do
    it 'return http success' do
      get api_v1_user_path(@user1.id)
      expect(response).to have_http_status(200)
    end

    it 'returns the value in the JSON response' do
      get api_v1_user_path(@user1.id)
      json_response = JSON.parse(response.body)
      expect(json_response['username']).to eq('user1')
    end
  end

  describe 'POST api/v1/users' do
    it 'return http success' do
      post '/api/v1/users', params: { user: { username: 'user2' } }
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
      expect(json_response['username']).to eq('user2')
    end
  end

  describe 'PUT api/v1/users' do
    it 'return http success' do
      put api_v1_user_path(@user1.id), params: { user: {
        username: 'Superman'
      } }
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response['username']).to eq('Superman')
    end
  end

  describe 'DESTROY api/v1/products' do
    it 'return http success' do
      delete api_v1_user_path(@user1.id)
      expect(response).to have_http_status(:success)
    end
  end
end
