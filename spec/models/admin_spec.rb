require 'spec_helper'

describe Admin do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(build(:admin)).to be_valid
  end

  # email, password, name, birth_date, bd_open, genderがあれば問題ない状態
  it "is valid with an email, password, name, birth_date, bd_open, gender" do
    admin = build(:admin)
    expect(admin).to be_valid
  end

  # emailがないとうまくいかない状態
  it "is invalid without an email" do
    admin = build(:admin, email: nil)
    expect(admin).to have(1).errors_on(:email)
  end

  # passwordがないとうまくいかない状態
  it "is invalid without a password" do
    admin = build(:admin, password: nil)
    expect(admin).to have(1).errors_on(:password)
  end

  # nameがないとうまくいかない状態
  it "is invalid without a name" do
    admin = build(:admin, name: nil)
    expect(admin).to have(1).errors_on(:name)
  end

  # birth_dateがないとうまくいかない状態
  it "is invalid without a birth_date" do
    admin = build(:admin, birth_date: nil)
    expect(admin).to have(1).errors_on(:birth_date)
  end

  # bd_openがないとうまくいかない状態
  it "is invalid without a bd_open" do
    admin = build(:admin, bd_open: nil)
    expect(admin).to have(1).errors_on(:bd_open)
  end

  # genderがないとうまくいかない状態
  it "is invalid without a gender" do
    admin = build(:admin, gender: nil)
    expect(admin).to have(1).errors_on(:gender)
  end

end
