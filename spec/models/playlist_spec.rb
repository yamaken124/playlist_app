require 'spec_helper'

describe Playlist do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(build(:playlist)).to be_valid
  end

  ## associationはつけないことにしたので
=begin
  # commentsとのassociationがしっかりできていること
  it "has an association with comments" do
    expect(create(:playlist).comments).to exist
  end

  # favoritesとのassociationがしっかりできていること
  it "has an association with favorites" do
    expect(create(:playlist).favorites).to exist
  end

  # musicsとのassociationがしっかりできていること
  it "has an association with musics" do
    expect(create(:playlist).musics).to exist
  end
=end

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
end
