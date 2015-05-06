require 'spec_helper'

describe Comment do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(build(:comment)).to be_valid
  end

  # contentがあれば有効な状態であること
  it "is valid with a content" do
    comment = build(:comment)
    expect(comment).to be_valid
  end

  # contentがなければ無効な状態であること
  it "is invalid without a content" do
    comment = build(:comment, content: nil)
    expect(comment).to have(1).errors_on(:content)
  end


end
