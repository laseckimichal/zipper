require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { is_expected.to have_many(:user_files) }
  end

  describe 'devise' do
    let(:user) { create(:user) }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'is valid with a unique email' do
      new_user = build(:user, email: user.email)
      expect(new_user).not_to be_valid
    end
  end
end
