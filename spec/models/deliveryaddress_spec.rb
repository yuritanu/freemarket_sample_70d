require 'rails_helper'
require 'spec_helper'

describe Deliveryaddress ,type: :model do
  context 'ウィザード形式3ページ目（必須事項は埋まっていない時にエラー表示をするか）' do
    it "必須項目入力済み、誤入力なし"do
      deliveryaddress = build(:deliveryaddress)
      expect(deliveryaddress).to be_valid
    end

    
    it "名字が入力されていないと進めない" do
      deliveryaddress = build(:deliveryaddress,family_name: nil)
      deliveryaddress.valid?
      expect(deliveryaddress.name_em).to include("は全角で入力してください")
    end

    it "名前が入力されていないと進めない" do
      deliveryaddress = build(:deliveryaddress,given_name: nil)
      deliveryaddress.valid?
      expect(deliveryaddress.name_em).to include("は全角で入力してください")
    end

    it "名字(カナ) が入力されていないと進めない" do
      deliveryaddress = build(:deliveryaddress,family_name_kana: nil)
      deliveryaddress.valid?
      expect(deliveryaddress.name_kana_em).to include("は全角カタカナで入力してください")
    end

    it "名前（カナ）が入力されていないと進めない" do
      deliveryaddress = build(:deliveryaddress,given_name_kana: nil)
      deliveryaddress.valid?
      expect(deliveryaddress.name_kana_em).to include("は全角カタカナで入力してください")
    end


    it "郵便番号が入力されていないと進めない" do
      deliveryaddress = build(:deliveryaddress,postal_code: nil)
      deliveryaddress.valid?
      expect(deliveryaddress.zipcode).to include("はハイフンなし、７桁の数字で入力してください")
    end

    it "市区町村が入力されていないと進めない" do
      deliveryaddress = build(:deliveryaddress,city: nil)
      deliveryaddress.valid?
      expect(deliveryaddress.full_width_city).to include("は全角で入力してください")
    end

    it "番地が入力されていないと進めない" do
      deliveryaddress = build(:deliveryaddress,address: nil)
      deliveryaddress.valid?
      expect(deliveryaddress.full_width_address).to include("は全角で入力してください")
    end
  end

  context "ウィザード形式3ページ目（誤入力時にエラー表示をするか）" do
    context "名前関係の誤入力" do
      it "名字が全角で入力されていないと進めない(アルファベットver)" do
        deliveryaddress = build(:deliveryaddress,family_name: "yamada")
        deliveryaddress.valid?
        expect(deliveryaddress.name_em).to include("は全角で入力してください")
      end
      it "名字が全角で入力されていないと進めない(半角ｶﾀｶﾅver)" do
        deliveryaddress = build(:deliveryaddress,family_name: "ﾔﾏﾀﾞ")
        deliveryaddress.valid?
        expect(deliveryaddress.name_em).to include("は全角で入力してください")
      end
  
  
      it "名前が全角入力されていないと進めない(アルファベットver)" do
        deliveryaddress = build(:deliveryaddress,given_name: "tarou")
        deliveryaddress.valid?
        expect(deliveryaddress.name_em).to include("は全角で入力してください")
      end
      it "名前が全角入力されていないと進めない(半角ｶﾀｶﾅver)" do
        deliveryaddress = build(:deliveryaddress,given_name:"ﾀﾛｳ")
        deliveryaddress.valid?
        expect(deliveryaddress.name_em).to include("は全角で入力してください")
      end
  
  
      it "名字（カナ）が全角で入力されていないと進めない(アルファベットver)" do
        deliveryaddress = build(:deliveryaddress,family_name_kana: "yamada")
        deliveryaddress.valid?
        expect(deliveryaddress.name_kana_em).to include("は全角カタカナで入力してください")
      end
      it "名字（カナ）が全角で入力されていないと進めない(半角ｶﾀｶﾅver)" do
        deliveryaddress = build(:deliveryaddress,family_name_kana: "ﾔﾏﾀﾞ")
        deliveryaddress.valid?
        expect(deliveryaddress.name_kana_em).to include("は全角カタカナで入力してください")
      end
  
  
      it "名前(カナ)が全角入力されていないと進めない(アルファベットver)" do
        deliveryaddress = build(:deliveryaddress,given_name_kana: "tarou")
        deliveryaddress.valid?
        expect(deliveryaddress.name_kana_em).to include("は全角カタカナで入力してください")
      end
      it "名前(カナ)が全角入力されていないと進めない(半角ｶﾀｶﾅver)" do
        deliveryaddress = build(:deliveryaddress,given_name_kana:"ﾀﾛｳ")
        deliveryaddress.valid?
        expect(deliveryaddress.name_kana_em).to include("は全角カタカナで入力してください")
      end
  
      it "名字（カナ）がカタカナで入力されていないと進めない（ひらがなver）" do
        deliveryaddress = build(:deliveryaddress,family_name_kana: "やまだ")
        deliveryaddress.valid?
        expect(deliveryaddress.name_kana_em).to include("は全角カタカナで入力してください")
      end
      it "名字（カナ）がカタカナで入力されていないと進めない(漢字ver)" do
        deliveryaddress = build(:deliveryaddress,family_name_kana: "山田")
        deliveryaddress.valid?
        expect(deliveryaddress.name_kana_em).to include("は全角カタカナで入力してください")
      end
  
  
      it "名前(カナ)がカタカナで入力されていないと進めない(ひらがなver)" do
        deliveryaddress = build(:deliveryaddress,given_name_kana: "たろう")
        deliveryaddress.valid?
        expect(deliveryaddress.name_kana_em).to include("は全角カタカナで入力してください")
      end
      it "名前(カナ)がカタカナで入力されていないと進めない(漢字ver)" do
        deliveryaddress = build(:deliveryaddress,given_name_kana:"ﾀﾛｳ")
        deliveryaddress.valid?
        expect(deliveryaddress.name_kana_em).to include("は全角カタカナで入力してください")
      end
    end

    context "数字関係" do

      it "郵便番号がハイフンありだと進めない" do
        deliveryaddress = build(:deliveryaddress,postal_code: "111-1111")
        deliveryaddress.valid?
        expect(deliveryaddress.zipcode).to include("はハイフンなし、７桁の数字で入力してください")
      end


      it "郵便番号が8文字以上だと進めない" do
        deliveryaddress = build(:deliveryaddress,postal_code: "11111111")
        deliveryaddress.valid?
        expect(deliveryaddress.zipcode).to include("はハイフンなし、７桁の数字で入力してください")
      end
      it "郵便番号が6文字以下だと進めない" do
        deliveryaddress = build(:deliveryaddress,postal_code: "111111")
        deliveryaddress.valid?
        expect(deliveryaddress.zipcode).to include("はハイフンなし、７桁の数字で入力してください")
      end
      it "郵便番号が全角だと進めない" do
        deliveryaddress = build(:deliveryaddress,postal_code: "１１１１１１１")
        deliveryaddress.valid?
        expect(deliveryaddress.zipcode).to include("はハイフンなし、７桁の数字で入力してください")
      end

      it "電話番号が9桁以下だと進めない" do
        deliveryaddress = build(:deliveryaddress,phone_number: "080472885")
        deliveryaddress.valid?
        expect(deliveryaddress.phone_number_check).to include("は不当な値です。ハイフンなし、10桁,又は11桁の番号で入力してください")
      end
      it "電話番号が12桁以下だと進めない" do
        deliveryaddress = build(:deliveryaddress,phone_number: "080472885772")
        deliveryaddress.valid?
        expect(deliveryaddress.phone_number_check).to include("は不当な値です。ハイフンなし、10桁,又は11桁の番号で入力してください")
      end
    end
    
    context "その他全角関係" do
      
      it "市区町村が半角英字が含むと進めない"do
        deliveryaddress = build(:deliveryaddress,city: "根室nemuro")
        deliveryaddress.valid?
        expect(deliveryaddress.full_width_city).to include("は全角で入力してください")
      end
      it "市区町村が半角数字が含むと進めない"do
        deliveryaddress = build(:deliveryaddress,city: "根室2222")
        deliveryaddress.valid?
        expect(deliveryaddress.full_width_city).to include("は全角で入力してください")
      end


      it "番地が半角英字だと進めない"do
        deliveryaddress = build(:deliveryaddress,address: "１a-a-a")
        deliveryaddress.valid?
        expect(deliveryaddress.full_width_address).to include("は全角で入力してください")
      end
      it "番地が半角数字だと進めない"do
        deliveryaddress = build(:deliveryaddress,address: "２２-22-22")
        deliveryaddress.valid?
        expect(deliveryaddress.full_width_address).to include("は全角で入力してください")
      end


      it "マンション名など部屋号室が半角英字だと進めない"do
        deliveryaddress = build(:deliveryaddress,building: "abc荘")
        deliveryaddress.valid?
        expect(deliveryaddress.full_width_building).to include("は全角で入力してください")
      end
      it "マンション名など部屋号室が半角数字だと進めない"do
        deliveryaddress = build(:deliveryaddress,building: "アパート荘22")
        deliveryaddress.valid?
        expect(deliveryaddress.full_width_building).to include("は全角で入力してください")
      end
    end
    
  end
end