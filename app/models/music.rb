class Music < ActiveRecord::Base
  belongs_to :playlist
  validates :url, presence: true

  #クラスメソッドでここはやるべき
  def movie_http
      musics = Music.where(playlist_id: self.playlist_id)
    if musics.count == 1
      youtube_id = musics.first.url
      http = "https://www.youtube.com/embed/" << youtube_id << "?playlist=" << youtube_id << "&loop=1"
    elsif musics.count >= 2
      record = musics.first
      http = "https://www.youtube.com/embed/" << record.url << "?playlist="
      musics.each do |music|
        if music.id == record.id
        else
          http = http <<  music.url << ","
        end
      end
      http[-1] = ""
      http = http << "&loop=1"
    else
    end
  end

end
