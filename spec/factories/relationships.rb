require 'faker'

FactoryGirl.define do
  factory :relationship do
    follower_id { Faker::Number.digit }
    followed_id { Faker::Number.digit }
  end
end
