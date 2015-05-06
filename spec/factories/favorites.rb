require 'faker'

FactoryGirl.define do
  factory :favorite do
    association :playlist
    association :user
  end
end
