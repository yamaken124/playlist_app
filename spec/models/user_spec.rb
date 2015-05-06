require 'spec_helper'

describe User do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  # emailとpasswordとname, birth_date, bd_open, genderがあれば正常に登録される
  it "is valid with an email, password, name, birth_date, bd_open, gender" do
    user = build(:user)
    expect(user).to be_valid
  end

  # emailなしではうまくいかないこと
  it "is invalid without an email" do
    user = build(:user, email: nil)
    expect(user).to have(1).errors_on(:email)
  end

  # passwordなしではうまくいかないこと
  it "is invalid without a password" do
    user = build(:user, password: nil)
    expect(user).to have(1).errors_on(:password)
  end

  # nameなしではうまくいかないこと
  it "is invalid without a name" do
    user = build(:user, name: nil)
    expect(user).to have(1).errors_on(:name)
  end

  # birth_dateなしではうまくいかないこと
  it "is invalid without a birth_date" do
    user = build(:user, birth_date: nil)
    expect(user).to have(1).errors_on(:birth_date)
  end

  # bd_openなしではうまくいかないこと
  it "is invalid without a bd_open" do
    user = build(:user, bd_open: nil)
    expect(user).to have(1).errors_on(:bd_open)
  end

  # genderなしではうまくいかないこと
  it "is invalid without a gender" do
    user = build(:user, gender: nil)
    expect(user).to have(1).errors_on(:gender)
  end

end
