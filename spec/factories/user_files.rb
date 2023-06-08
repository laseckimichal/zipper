FactoryBot.define do
  factory :user_file do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/sample.txt'), 'text/plain') }
    user
  end
end
