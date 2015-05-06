require 'faker'

FactoryGirl.define do
  factory :user do
    password { Faker::Lorem.characters(10) }
    email { Faker::Internet.email }
    name { Faker::Name.name }
    birth_date { Faker::Time.between(2.days.ago, Time.now) }
    bd_open { Faker::Number.between(from = 0, to = 1) }
    fav_music_genre { Faker::Number.between(from = 0, to = 4) }
    comment { Faker::Lorem.sentence }
    gender { Faker::Number.between(from = 0, to = 1) }
    image { Faker::Lorem.word }

=begin
    after(:create) do |user|
      user.playlists << FactoryGirl.build(:playlist, user: user)
      user.comments << FactoryGirl.build(:comment, user: user)
    end
=end
  end
end
