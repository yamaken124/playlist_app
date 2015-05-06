require 'faker'

FactoryGirl.define do
  factory :admin do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(10) }
    name { Faker::Name.name }
    birth_date { Faker::Time.between(2.days.ago, Time.now) }
    bd_open { Faker::Number.between(from = 0, to = 1) }
    gender { Faker::Number.between(from = 0, to = 1) }
  end
end
