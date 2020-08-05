require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    it "全ての情報が入力されていれば登録できること" do
      expect(build(:user)).to be_valid
    end

    it "nameが空では登録できないこと" do
      user = build(:user, name:"")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email:"")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "passwordが空では登録できないこと" do
      user = build(:user, password:"")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmation登録できないこと" do
      user = build(:user, password_confirmation:"")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "emailが重複していたら登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "emailに@とドメインがない場合は登録できないこと" do
      user = build(:user, email:"kkkgmail")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "emailに@がない場合は登録できないこと" do
      user = build(:user, email:"kkkgmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "emailにドメインがない場合は登録できないこと" do
      user = build(:user, email:"kkkgmail@com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "passwo", password_confirmation: "passwo")
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "passw", password_confirmation: "passw")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end