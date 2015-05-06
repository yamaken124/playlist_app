require 'spec_helper'

describe Favorite do
  # 有効なファクトリを持っていること
  it "has a valid factory" do
    expect(build(:favorite)).to be_valid
  end

  # playlist_idとuser_idが紐付いて登録されること
  it "is valid with a playlist_id, user_id" do
    favorite = build(:favorite)
    expect(favorite).to be_valid
  end
end
