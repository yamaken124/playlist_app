require 'spec_helper'

describe Playlist do
  # タイトルとユーザーIDがあれば有効な状態であること
  it "is valid with a title, user_id" do
    playlist = Playlist.new(
      user_id: 100,
      title: 'jazz',
    )
    expect(playlist).to be_valid
  end
  # タイトルがなければ無効な状態=バリデーション
  it "is invalid without a title" do
    expect(Playlist.new(title: nil)).to have(1).errors_on(:title)
  end
  # ユーザーIDがなければ無効な状態=バリデーション
  it "is invalid without a user_id" do
    expect(Playlist.new(user_id: nil)).to have(1).errors_on(:user_id)
  end
end
