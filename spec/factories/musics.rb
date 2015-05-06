require 'faker'

FactoryGirl.define do
  factory :music do
    association :playlist
    title { Faker::Name.title }
    url { Faker::Lorem.characters(8) }
  end
end

