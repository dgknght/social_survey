FactoryGirl.define do
  factory :survey do
    user
    name { Faker::Commerce.department }
    description { Faker::Lorem.sentence 2 }
  end
end
