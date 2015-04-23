class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :urls
  enum genre: %i(pops rock jazz classic others)
  validates :title, presence: true

  def self.ranking(date, genre)
    if date.present?
      case date
      when "today"
        from = Time.now.at_beginning_of_day
        to = from + 1.day
        self.where(created_at: from...to).order(count_fav: :desc, created_at: :desc).limit(20)
      when "week"
        from = Time.now.at_beginning_of_week
        to = from + 1.week
        self.where(created_at: from...to).order(count_fav: :desc, created_at: :desc).limit(20)
      when "month"
        from = Time.now.at_beginning_of_month
        to = from + 1.month
        self.where(created_at: from...to).order(count_fav: :desc, created_at: :desc).limit(20)
      end
    elsif genre.present?
      case genre
      when "pops"
        self.where(genre: 0).order(count_fav: :desc, created_at: :desc).limit(10)
      when "rock"
        self.where(genre: 1).order(count_fav: :desc, created_at: :desc).limit(10)
      when "jazz"
        self.where(genre: 2).order(count_fav: :desc, created_at: :desc).limit(10)
      when "classic"
        self.where(genre: 3).order(count_fav: :desc, created_at: :desc).limit(10)
      when "others"
        self.where(genre: 4).order(count_fav: :desc, created_at: :desc).limit(10)
      end
    else
      self.order("count_fav DESC, created_at DESC").limit(20)
    end
  end

  #playlistのデータ使ってないじゃん
  #date, genre両方引数にとったらこんらん
  #他の人だったらどう使うか、伝わりやすさが大事
  #意図が伝わりやすく
  #メソッドだけで表しづらければクラスを作ってしまう。
  #引数わかりやすく
  #プログラミングは思いやり。そもそも読みやすくしてある理由を考える。複数人での開発がスムーズにいくようにする意識を持つ。
  def date_ranking_title(date)
      case date
      when "today"
        "本日のランキング"
      when "week"
        "週間ランキング"
      when "month"
        "月間ランキング"
      end
  end
  
  def genre_ranking_title(genre)
      case genre
      when "pops"
        "PopsランキングTop10"
      when "rock"
        "RockランキングTop10"
      when "jazz"
        "JazzランキングTop10"
      when "classic"
        "ClassicランキングTop10"
      when "others"
        "OthersランキングTop10"
      end
  end

end
