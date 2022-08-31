FactoryBot.define do
  factory :user do
    email { Faker::Lorem.email }
    password { Faker::Lorem.password }
  end
end
