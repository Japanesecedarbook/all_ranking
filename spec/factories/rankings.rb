FactoryBot.define do
  factory :ranking do
    title              {"タイトル"}
    rank1              {"1位"}
    rank2              {"2位"}
    rank3              {"3位"}
    image              {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/inu.jpeg'), 'image/jpeg')}
    user
  end
end