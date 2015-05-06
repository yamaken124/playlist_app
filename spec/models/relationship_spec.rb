require 'spec_helper'

describe Relationship do
  # 有効なファクトリを持つ
  it "has a valid factory" do
    expect(build(:relationship)).to be_valid
  end

  # バリデーションはないが、とりあえずfollower_idとfollowed_idは必要
  it "is valid with a follower_id, followed_id" do
    relationship = build(:relationship)
    expect(relationship).to be_valid
  end

end
