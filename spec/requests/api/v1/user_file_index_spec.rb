require 'rails_helper'

RSpec.describe UserFile do
  let(:user) { create(:user) }

  describe 'GET /api/v1/files' do
    it 'returns a JSON response with user files' do
      sign_in(user)
      user_file = create(:user_file, user: user)

      get '/api/v1/files'

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)).to eq([response_body(user_file)])
    end

    it 'returns unauthorized if user is not signed in' do
      get '/api/v1/files'

      expect(response).to have_http_status(:unauthorized)
    end
  end

  def response_body(user_file)
    {
      'id'         => user_file.id,
      'file'       => { 'url' => user_file.file_url },
      'user_id'    => user_file.user_id,
      'created_at' => user_file.created_at.to_time.iso8601(3),
      'updated_at' => user_file.updated_at.to_time.iso8601(3)
    }
  end
end
