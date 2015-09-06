FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'please01'
    password_confirmation 'please01'
  end
end
