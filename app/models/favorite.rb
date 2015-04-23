class Favorite < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :user

  def already_fav?
    if Favorite.where(playlist_id: self.playlist_id).where(user_id: self.user_id).present?
      true
    else
      false
    end
  end
end
