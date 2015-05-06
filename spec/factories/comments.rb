require 'faker'

FactoryGirl.define do
  factory :comment do
    association :user
    association :playlist
    content { Faker::Lorem.sentence }
  end
end
