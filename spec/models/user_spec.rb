require 'rails_helper'
require 'spec_helper'
require 'devise'

describe User do
  context 'ウィザード形式1ページ目（必須事項は埋まっていない時にエラー表示をするか）'do
    it "必須項目が間違いなく入力されていれば進める"do
      user = build(:user)
      expect(user).to be_valid
    end
    
    it "ニックネームがないと進めない"do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "メールアドレスがない場合は進めない" do
      user = build(:user,email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードがない場合は進めない" do
      user = build(:user,password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードは２回入力しない場合は進めない" do
      user = build(:user,password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "名字が入力されていないと進めない" do
      user = build(:user,family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "名前が入力されていないと進めない" do
      user = build(:user,given_name: nil)
      user.valid?
      expect(user.errors[:given_name]).to include("を入力してください")
    end

    it "名字(カナ) が入力されていないと進めない" do
      user = build(:user,family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "名前（カナ）が入力されていないと進めない" do
      user = build(:user,given_name_kana: nil)
      user.valid?
      expect(user.errors[:given_name_kana]).to include("を入力してください")
    end

    it "生年月日が入力されていないと進めない" do
      user = build(:user,birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
    
  end


  context 'ウィザード形式1ページ目（誤入力時のエラー表示がされるか）'do
    it "必須項目が間違いなく入力されていれば進める"do
      user = build(:user)
      expect(user).to be_valid
    end

    it "メールアドレスが誤入力された（正規表現とあっていない）場合は進めない:devise" do
      user = build(:user,email: %w[user@foo..com user_at_foo,org example.user@foo.
        foo@bar_baz.com foo@bar+baz.com])
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    it "メールアドレスが誤入力された（正規表現とあっていない）場合は進めない:自作メソッド" do
      user = build(:user,email: %w[user@foo..com user_at_foo,org example.user@foo.
        foo@bar_baz.com foo@bar+baz.com])
      user.valid?
      expect(user.valid_email?).to eq(nil)
    end

    it "パスワードが7文字以上でないと進めない" do
      user = build(:user,password: "aaa1",password_confirmation: "aaa1")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it "パスワードが英字１文字、数字１文字以上入っていないと進めない" do
      user = build(:user,password: "aaaaaaa",password_confirmation: "aaaaaaa")
      user.valid?
      expect(user.password_complexity).to include("は英字と数字をそれぞれ1文字以上含める必要があります")
    end

    it "名字が全角で入力されていないと進めない(アルファベットver)" do
      user = build(:user,family_name: "yamada")
      user.valid?
      expect(user.errors[:family_name]).to include("は全角で入力してください")
    end
    it "名字が全角で入力されていないと進めない(半角ｶﾀｶﾅver)" do
      user = build(:user,family_name: "ﾔﾏﾀﾞ")
      user.valid?
      expect(user.errors[:family_name]).to include("は全角で入力してください")
    end


    it "名前が全角入力されていないと進めない(アルファベットver)" do
      user = build(:user,given_name: "tarou")
      user.valid?
      expect(user.errors[:given_name]).to include("は全角で入力してください")
    end
    it "名前が全角入力されていないと進めない(半角ｶﾀｶﾅver)" do
      user = build(:user,given_name:"ﾀﾛｳ")
      user.valid?
      expect(user.errors[:given_name]).to include("は全角で入力してください")
    end


    it "名字（カナ）が全角で入力されていないと進めない(アルファベットver)" do
      user = build(:user,family_name_kana: "yamada")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角カタカナで入力してください")
    end
    it "名字（カナ）が全角で入力されていないと進めない(半角ｶﾀｶﾅver)" do
      user = build(:user,family_name_kana: "ﾔﾏﾀﾞ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角カタカナで入力してください")
    end


    it "名前(カナ)が全角入力されていないと進めない(アルファベットver)" do
      user = build(:user,given_name_kana: "tarou")
      user.valid?
      expect(user.errors[:given_name_kana]).to include("は全角カタカナで入力してください")
    end
    it "名前(カナ)が全角入力されていないと進めない(半角ｶﾀｶﾅver)" do
      user = build(:user,given_name_kana:"ﾀﾛｳ")
      user.valid?
      expect(user.errors[:given_name_kana]).to include("は全角カタカナで入力してください")
    end

    it "名字（カナ）がカタカナで入力されていないと進めない（ひらがなver）" do
      user = build(:user,family_name_kana: "やまだ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角カタカナで入力してください")
    end
    it "名字（カナ）がカタカナで入力されていないと進めない(漢字ver)" do
      user = build(:user,family_name_kana: "山田")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角カタカナで入力してください")
    end


    it "名前(カナ)がカタカナで入力されていないと進めない(ひらがなver)" do
      user = build(:user,given_name_kana: "たろう")
      user.valid?
      expect(user.errors[:given_name_kana]).to include("は全角カタカナで入力してください")
    end
    it "名前(カナ)がカタカナで入力されていないと進めない(漢字ver)" do
      user = build(:user,given_name_kana:"ﾀﾛｳ")
      user.valid?
      expect(user.errors[:given_name_kana]).to include("は全角カタカナで入力してください")
    end
  end
  context "一意性" do
    it "すでに登録されているメールアドレスは登録できない" do
      User.create(
        nickname: "フリマ",
        email: "japan@gmail",
        password: "japan12",
        password_confirmation: "japan12",
        family_name: "山田",
        given_name: "太郎",
        family_name_kana: "ヤマダ",
        given_name_kana: "タロウ",
        birthday: "20200523",
      )
      user = User.new(
        nickname: "フリマ子",
        email: "japan@gmail",
        password: "japan122",
        password_confirmation: "japan122",
        family_name: "山田",
        given_name: "花子",
        family_name_kana: "ヤマダ",
        given_name_kana: "ハナコ",
        birthday: "20200524",
      )
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
  end
end