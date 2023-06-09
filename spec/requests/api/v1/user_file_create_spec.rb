require 'rails_helper'

RSpec.describe UserFile do
  let(:user) { create(:user) }

  describe 'POST /api/v1/files' do
    it 'creates a new user file' do
      sign_in(user)

      expect do
        post '/api/v1/files', params: { file: user_file_sample }
      end.to change(described_class, :count).by(1)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)).to include('link', 'password')
    end

    it 'returns error if file upload fails' do
      sign_in(user)

      post '/api/v1/files', params: { file: nil }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)).to eq({ 'error' => 'Failed to upload file.' })
    end

    it 'returns unauthorized if user is not signed in' do
      post '/api/v1/files', params: { file: user_file_sample }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  def user_file_sample
    @user_file_sample ||= Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/sample.txt'), 'text/plain')
  end
end
