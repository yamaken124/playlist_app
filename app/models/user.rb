class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :playlists
  has_many :comments
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :bd_open, presence: true
  validates :gender, presence: true

  # あなたがフォロー
  # has_many :relationships, :dependent => :destroy
  # has_many :followers, :through => :relationships

  # あなたをフォロー
  # has_many :followerships, :class_name => 'Relationship', :foreign_key => :follower_id, :dependent => :destroy
  # has_many :follwowers, :through => :followerships, :source => :user
  
  # enum gender: {man: 0, woman: 1} と同じ
  enum gender: %i(man woman)
  enum fav_music_genre: %i(pops rock jazz classic others)
  enum bd_open: %i(open not_open)

  mount_uploader :image, ImageUploader
end
