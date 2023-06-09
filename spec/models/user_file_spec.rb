require 'rails_helper'

RSpec.describe UserFile do
  let(:user_file) { build(:user_file) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user_file).to be_valid
    end

    it 'is not valid without a file' do
      user_file.file = nil
      expect(user_file).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
