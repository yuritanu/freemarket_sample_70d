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
      binding.pry
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
    product = build(:product, product_status: "")
    product.valid?
    expect(product.errors[:product_status_id]).to include("を入力してください")
end

it "is invalid without a delivery_cost_id" do
    product = build(:product, delivery_cost_id: "")
    product.valid?
    expect(product.errors[:delivery_cost_id]).to include("を入力してください")
end

it "is invalid without a prefecture_id" do
    product = build(:product, prefecture_id: "")
    product.valid?
    expect(product.errors[:prefecture_id]).to include("を入力してください")
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

#descriptionの文字が1000文字以上と以下の場合
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