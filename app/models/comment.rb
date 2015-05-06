class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist
  validates :content, presence: true
  # aaaaaaaaa
end
