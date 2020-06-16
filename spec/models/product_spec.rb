require 'rails_helper'

describe Product do
  describe '#create' do
    it "全て揃っている時保存できる" do
        product = build(:product)
        expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a explanation" do
      product = build(:product, explanation: "")
      product.valid?
      expect(product.errors[:explanation]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
        product = build(:product, category_id: "")
        product.valid?
        expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "is invalid without a product_status_id" do
        product = build(:product, product_status_id: "")
        product.valid?
        expect(product.errors[:product_status_id]).to include("を入力してください")
    end

    it "is invalid without a delivery_cost_id" do
        product = build(:product, delivery_cost_id: "")
        product.valid?
        expect(product.errors[:delivery_cost_id]).to include("を入力してください")
    end

    it "is invalid without a shipping_origin_id" do
        product = build(:product, shipping_origin_id: "")
        product.valid?
        expect(product.errors[:shipping_origin_id]).to include("を入力してください")
    end

    it "is invalid without a delivery_day_id" do
        product = build(:product, delivery_day_id: "")
        product.valid?
        expect(product.errors[:delivery_day_id]).to include("を入力してください")
    end

    it "is invalid without a price" do
        product = build(:product, price: "")
        product.valid?
        expect(product.errors[:price]).to include("を入力してください")
    end

    #nameの文字が40文字以上と以下の場合
    it "is invalid name is too long maximum 40 characters" do
        product = build(:product, name: "a" * 41)
        product.valid?
        expect(product.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "is valid with a name that has less than 40 characters" do
        product = build(:product, name: "a" * 39)
        expect(product).to be_valid
    end

    #explanationの文字が1000文字以上と以下の場合
    it "is invalid explanation is too long maximum 40 characters" do
        product = build(:product, explanation: "a" * 1001)
        product.valid?
        expect(product.errors[:explanation]).to include("は1000文字以内で入力してください")
    end

    it "is valid with a explanation that has less than 1000 characters" do
        product = build(:product, explanation: "a" * 1000)
        expect(product).to be_valid
    end

    #priceが9999999円以上の場合
    it "is invalid price is too much maximum 9999999" do
        product = build(:product, price: 10000000)
        product.valid?
        expect(product.errors[:price]).to include("は一覧にありません")
    end

    #priceが9999999円の場合
    it "is valid price is too much maximum 9999999" do
        product = build(:product, price: 9999999)
        expect(product).to be_valid
    end

    #priceが300円以下の場合
    it "is invalid with a that has less than 300" do
        product = build(:product, price: 299)
        product.valid?
        expect(product.errors[:price]).to include("は一覧にありません")
    end

    #priceが300円の場合
    it "is valid with a that has less than 300" do
        product = build(:product, price: 300)
        expect(product).to be_valid
    end

    #brandが無くても保存できる
    it "is valid without a brand" do
        product = build(:product, brand: "")
        expect(product).to be_valid
    end
  end
end


describe Product do
    describe '#update' do
      # ↓全カラム共通テスト
      it "1.全て揃っている時保存できる" do
          product = build(:product)
          expect(product).to be_valid
      end


      # ↓nameカラムに関してのテスト
      it "2.出品した商品のnameを変更できる" do
          product = build(:product)
          product[:name] = 'Macbook'
          expect(product[:name]).to eq 'Macbook'
      end

      it "3.出品した商品のnameを変更すると、更新前のnameとは異なる" do
          product = build(:product)
          product[:name] = 'Macbook'
          expect(product[:name]).not_to eq 'バッグ'
      end

      it "4.出品した商品のnameを変更して更新できる" do
          product = build(:product)
          product[:name] = 'Macbook'
          expect(product).to be_valid
      end
      
      it "5.出品した商品のnameを空にすると、更新できない" do
          product = build(:product)
          product[:name] = ''
          product.valid?
          expect(product.errors[:name]).to include("を入力してください")
      end

      it "6.nameに41文字以上の値は保存できない" do
          product = build(:product)
          product[:name] = 'a' * 41
          product.valid?
          expect(product.errors[:name]).to include("は40文字以内で入力してください")
      end

      it "7.nameに40文字なら保存できる" do
          product = build(:product)
          product[:name] = 'a' * 40
          expect(product).to be_valid
      end


      # ↓explanationカラムに関してのテスト
      it "8.出品した商品のexplanationを変更できる" do
        product = build(:product)
        product[:explanation] = '2020年6月時の最新版'
        expect(product[:explanation]).to eq '2020年6月時の最新版'
      end

      it "9.出品した商品のexplanationを変更すると、更新前のexplanationとは異なる" do
          product = build(:product)
          product[:explanation] = '2020年6月時の最新版'
          expect(product[:explanation]).not_to eq 'ビンテージもの'
      end

      it "10.出品した商品のexplanationを変更して更新できる" do
          product = build(:product)
          product[:explanation] = '2020年6月時の最新版'
          expect(product).to be_valid
      end
      
      it "11.出品した商品のexplanationを空にすると、更新できない" do
          product = build(:product)
          product[:explanation] = ''
          product.valid?
          expect(product.errors[:explanation]).to include("を入力してください")
      end

      it "12.explanationに1001文字以上の値は保存できない" do
          product = build(:product)
          product[:explanation] = 'a' * 1001
          product.valid?
          expect(product.errors[:explanation]).to include("は1000文字以内で入力してください")
      end

      it "13.explanationに1000文字なら保存できる" do
          product = build(:product)
          product[:explanation] = 'a' * 1000
          expect(product).to be_valid
      end


      # ↓category_idカラムに関してのテスト
      it "14.出品した商品のcategory_idを変更できる" do
          product = build(:product)
          product[:category_id] = 2
          expect(product[:category_id]).to eq 2
      end

      it "15.出品した商品のcategory_idを変更すると、更新前のcategory_idとは異なる" do
          product = build(:product)
          product[:category_id] = 2
          expect(product[:category_id]).not_to eq 1
      end
      
      it "16.出品した商品のcategory_idを空にすると、更新できない" do
          product = build(:product)
          product[:category_id] = ''
          product.valid?
          expect(product.errors[:category_id]).to include("を入力してください")
      end
      

      # ↓brandカラムに関してのテスト
      it "17.出品した商品のbrandを変更できる" do
          product = build(:product)
          product[:brand] = 'Mac'
          expect(product[:brand]).to eq 'Mac'
      end

      it "18.出品した商品のbrandを変更すると、更新前のbrandとは異なる" do
          product = build(:product)
          product[:brand] = 'Mac'
          expect(product[:brand]).not_to eq 'ルイヴィトン'
      end

      it "19.出品した商品のexplanationを変更して更新できる" do
          product = build(:product)
          product[:brand] = 'Mac'
          expect(product).to be_valid
      end

      it "20.出品した商品のbrandを空にしても保存できる" do
          product = build(:product)
          product[:brand] = ''
          expect(product).to be_valid
      end


      # ↓product_status_idカラムに関してのテスト
      it "21.出品した商品のproduct_status_idを変更すると、更新前のproduct_status_idとは異なる" do
          product = build(:product)
          product[:product_status_id] = 3
          expect(product[:product_status_id]).not_to eq 2
      end

      it "22.出品した商品のproduct_status_idを変更して更新できる" do
          product = build(:product)
          product[:product_status_id] = 3
          expect(product).to be_valid
      end
      
      it "23.出品した商品のproduct_status_idを空にすると、更新できない" do
          product = build(:product)
          product[:product_status_id] = ''
          product.valid?
          expect(product.errors[:product_status_id]).to include("を入力してください")
      end


      # ↓delivery_cost_idカラムに関してのテスト
      it "24.出品した商品のdelivery_cost_idを変更すると、更新前のdelivery_cost_idとは異なる" do
          product = build(:product)
          product[:delivery_cost_id] = 2
          expect(product[:delivery_cost_id]).not_to eq 1
      end

      it "25.出品した商品のdelivery_cost_idを変更して更新できる" do
          product = build(:product)
          product[:delivery_cost_id] = 2
          expect(product).to be_valid
      end
      
      it "26.出品した商品のdelivery_cost_idを空にすると、更新できない" do
          product = build(:product)
          product[:delivery_cost_id] = ''
          product.valid?
          expect(product.errors[:delivery_cost_id]).to include("を入力してください")
      end


      # ↓shipping_origin_idカラムに関してのテスト
      it "27.出品した商品のshipping_origin_idを変更すると、更新前のshipping_origin_idとは異なる" do
          product = build(:product)
          product[:shipping_origin_id] = 1
          expect(product[:shipping_origin_id]).not_to eq 5
      end

      it "28.出品した商品のshipping_origin_idを変更して更新できる" do
          product = build(:product)
          product[:shipping_origin_id] = 1
          expect(product).to be_valid
      end
      
      it "29.出品した商品のshipping_origin_idを空にすると、更新できない" do
          product = build(:product)
          product[:shipping_origin_id] = ''
          product.valid?
          expect(product.errors[:shipping_origin_id]).to include("を入力してください")
      end


      # ↓delivery_day_idカラムに関してのテスト
      it "30.出品した商品のdelivery_day_idを変更すると、更新前のdelivery_day_idとは異なる" do
          product = build(:product)
          product[:delivery_day_id] = 1
          expect(product[:sdelivery_day_id]).not_to eq 2
      end

      it "31.出品した商品のdelivery_day_idを変更して更新できる" do
          product = build(:product)
          product[:delivery_day_id] = 1
          expect(product).to be_valid
      end
      
      it "32.出品した商品のdelivery_day_idを空にすると、更新できない" do
          product = build(:product)
          product[:delivery_day_id] = ''
          product.valid?
          expect(product.errors[:delivery_day_id]).to include("を入力してください")
      end


      # ↓priceカラムに関してのテスト
      it "33.出品した商品のpriceを変更できる" do
          product = build(:product)
          product[:price] = 5000
          expect(product[:price]).to eq 5000
      end

      it "34.出品した商品のpriceを変更すると、更新前のpriceとは異なる" do
          product = build(:product)
          product[:price] = 5000
          expect(product[:price]).not_to eq 3000
      end

      it "35.出品した商品のpriceを変更して更新できる" do
          product = build(:product)
          product[:price] = 5000
          expect(product).to be_valid
      end
      
      it "36.出品した商品のpriceを空にすると、更新できない" do
          product = build(:product)
          product[:price] = ''
          product.valid?
          expect(product.errors[:price]).to include("を入力してください")
      end

      it "37.priceに100000以上の値は保存できない" do
          product = build(:product)
          product[:price] = 10000000
          product.valid?
          expect(product.errors[:price]).to include("は一覧にありません")
      end

      it "38.priceが9999999の値なら保存できる" do
          product = build(:product)
          product[:price] = 9999999
          expect(product).to be_valid
      end

      it "39.priceが299以下の値は保存できない" do
          product = build(:product)
          product[:price] = 299
          product.valid?
          expect(product.errors[:price]).to include("は一覧にありません")
      end

      it "40.priceが300の値なら保存できる" do
          product = build(:product)
          product[:price] = 300
          expect(product).to be_valid
      end
    end
end