require 'faker'

FactoryGirl.define do
  factory :playlist do
    association :user
    title { Faker::Name.title }
    comment { Faker::Lorem.sentence }
    genre "rock"
    # genre { Faker::Number.between(from = 0, to = 4) }
    count_fav { Faker::Number.digit }
    factory :invalid_playlist do
      title nil
    end
=begin
    title "jazz"
    after(:create) do |playlist|
      playlist.comments << FactoryGirl.build(:comment, playlist: playlist)
      playlist.favorites << FactoryGirl.build(:favorite, playlist: playlist)
      playlist.musics << FactoryGirl.build(:music, playlist: playlist)
      playlist.user << (:user playlist: playlist)
    end
=end
  end
end
