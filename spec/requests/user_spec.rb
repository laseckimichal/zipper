require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  describe 'POST /users' do
    it 'creates a new user account' do
      user_params = { user: { email: Faker::Internet.email, password: Faker::Internet.password } }

      expect do
        post '/users', params: user_params
      end.to change(described_class, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'POST /users/sign_in' do
    it 'logs in an existing user' do
      sign_in_params = { user: { email: user.email, password: user.password } }

      post '/users/sign_in', params: sign_in_params

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /users/sign_out' do
    it 'logs out a logged-in user' do
      sign_in(user)

      delete '/users/sign_out'

      expect(response).to have_http_status(:no_content)
    end
  end
end
