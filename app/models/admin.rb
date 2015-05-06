class Admin < ActiveRecord::Base
  #########
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: %i(man woman)
  enum fav_music_genre: %i(pops rock jazz classic others)
  enum bd_open: %i(open not_open)

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :bd_open, presence: true
  validates :gender, presence: true

end
