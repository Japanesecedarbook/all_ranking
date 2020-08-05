require 'rails_helper'
RSpec.describe Ranking, type: :model do
  describe '#create' do
    it "全ての入力条件を満たしたら投稿できること" do
      expect(build(:ranking)).to be_valid
    end

    it "タイトルが空では投稿できないこと" do
      ranking = build(:ranking, title:"")
      ranking.valid?
      expect(ranking.errors[:title]).to include("を入力してください")
    end

    it "1位が空では投稿できないこと" do
      ranking = build(:ranking, rank1:"")
      ranking.valid?
      expect(ranking.errors[:rank1]).to include("を入力してください")
    end

    it "2位が空では投稿できないこと" do
      ranking = build(:ranking, rank2:"")
      ranking.valid?
      expect(ranking.errors[:rank2]).to include("を入力してください")
    end

    it "3位が空では投稿できないこと" do
      ranking = build(:ranking, rank3:"")
      ranking.valid?
      expect(ranking.errors[:rank3]).to include("を入力してください")
    end

    it "画像が選択されていなければ投稿できないこと" do
      ranking = build(:ranking, image:nil)
      ranking.valid?
      expect(ranking.errors[:image]).to include("を入力してください")
    end

    it "タイトルが21文字以上では投稿できないこと" do
      ranking = build(:ranking, title:"aaaaabbbbbcccccddddde")
      ranking.valid?
      expect(ranking.errors[:title]).to include("は20文字以内で入力してください")
    end

    it "タイトルが20文字以以下では投稿できること" do
      ranking = build(:ranking, title:"aaaaabbbbbcccccddddd")
      ranking.valid?
    end

    it "タイトルが21文字以上では投稿できないこと" do
      ranking = build(:ranking, title:"aaaaabbbbbcccccddddde")
      ranking.valid?
      expect(ranking.errors[:title]).to include("は20文字以内で入力してください")
    end

    it "1位が20文字以以下では投稿できること" do
      ranking = build(:ranking, rank1:"aaaaabbbbbcccccddddd")
      ranking.valid?
    end

    it "1位が21文字以上では投稿できないこと" do
      ranking = build(:ranking, rank1:"aaaaabbbbbcccccddddde")
      ranking.valid?
      expect(ranking.errors[:rank1]).to include("は20文字以内で入力してください")
    end

    it "2位が20文字以以下では投稿できること" do
      ranking = build(:ranking, rank2:"aaaaabbbbbcccccddddd")
      ranking.valid?
    end

    it "2位が21文字以上では投稿できないこと" do
      ranking = build(:ranking, rank2:"aaaaabbbbbcccccddddde")
      ranking.valid?
      expect(ranking.errors[:rank2]).to include("は20文字以内で入力してください")
    end

    it "3位が20文字以以下では投稿できること" do
      ranking = build(:ranking, rank3:"aaaaabbbbbcccccddddd")
      ranking.valid?
    end

    it "3位が21文字以上では投稿できないこと" do
      ranking = build(:ranking, rank3:"aaaaabbbbbcccccddddde")
      ranking.valid?
      expect(ranking.errors[:rank3]).to include("は20文字以内で入力してください")
    end
  end
end

