FactoryBot.define do
  factory :user do
    name                  {"test"}
    email                 {"sample@sample.com"}
    password              {"password"}
    password_confirmation {"password"}
  end
end