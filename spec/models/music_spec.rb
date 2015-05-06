require 'spec_helper'

describe Music do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(build(:music)).to be_valid
  end
  # プレイリストIDとタイトルとurlがあれば有効な状態であること
  it "is valid with a playlist_id, title, url" do
    music = build(:music)
    expect(music).to be_valid
  end
  # urlがなければ無効な状態であること＝バリデーション
  it "is invalid without a url" do
    music = build(:music, url: nil)
    expect(music).to have(1).errors_on(:url)
  end

  describe "check movie_http" do
    before :each do
      @music1 = Music.create(url: "jazz")
      context "returning movie_http for iframe"do
        it "returns a music's movie_http as a string" do
          music = Music.new(playlist_id: @music1.playlist_id)
          expect(music.movie_http).to eq "https://www.youtube.com/embed/jazz?playlist=jazz&loop=1"
        end
        it "does not return a music's movie_http without an url" do

          music = Music.new(playlist_id: @music1.playlist_id)
          expect(music.movie_http).to eq nil
        end
      end
    end
  end
end
