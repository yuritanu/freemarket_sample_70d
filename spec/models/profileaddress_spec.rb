require 'rails_helper'
require 'spec_helper'

describe Profileaddress ,type: :model do
  context 'ウィザード形式2ページ目(誤入力時)'do
    it "誤入力なし"do
      profileaddress = build(:profileaddress)
      expect(profileaddress).to be_valid
    end


    it "郵便番号がハイフンありだと進めない"do
      profileaddress = build(:profileaddress,postal_code: "111-1111")
      profileaddress.valid?
      expect(profileaddress.zipcode).to include("は不当な値です。ハイフンなし、７桁の数字で入力してください")
    end


    it "郵便番号が8文字以上だと進めない"do
      profileaddress = build(:profileaddress,postal_code: "11111111")
      profileaddress.valid?
      expect(profileaddress.zipcode).to include("は不当な値です。ハイフンなし、７桁の数字で入力してください")
    end
    it "郵便番号が6文字以下だと進めない"do
      profileaddress = build(:profileaddress,postal_code: "111111")
      profileaddress.valid?
      expect(profileaddress.zipcode).to include("は不当な値です。ハイフンなし、７桁の数字で入力してください")
    end
    it "郵便番号が全角だと進めない"do
      profileaddress = build(:profileaddress,postal_code: "１１１１１１１")
      profileaddress.valid?
      expect(profileaddress.zipcode).to include("は不当な値です。ハイフンなし、７桁の数字で入力してください")
    end


    it "市区町村が半角英字が含むと進めない"do
      profileaddress = build(:profileaddress,city: "根室nemuro")
      profileaddress.valid?
      expect(profileaddress.full_width_city).to include("は全角で入力してください")
    end
    it "市区町村が半角数字が含むと進めない"do
      profileaddress = build(:profileaddress,city: "根室2222")
      profileaddress.valid?
      expect(profileaddress.full_width_city).to include("は全角で入力してください")
    end


    it "番地が半角英字だと進めない"do
      profileaddress = build(:profileaddress,address: "１a-a-a")
      profileaddress.valid?
      expect(profileaddress.full_width_address).to include("は全角で入力してください")
    end
    it "番地が半角数字だと進めない"do
      profileaddress = build(:profileaddress,address: "２２-22-22")
      profileaddress.valid?
      expect(profileaddress.full_width_address).to include("は全角で入力してください")
    end


    it "マンション名など部屋号室が半角英字だと進めない"do
      profileaddress = build(:profileaddress,building: "abc荘")
      profileaddress.valid?
      expect(profileaddress.full_width_building).to include("は全角で入力してください")
    end
    it "マンション名など部屋号室が半角数字だと進めない"do
      profileaddress = build(:profileaddress,building: "アパート荘22")
      profileaddress.valid?
      expect(profileaddress.full_width_building).to include("は全角で入力してください")
    end
    

  end 

  

end