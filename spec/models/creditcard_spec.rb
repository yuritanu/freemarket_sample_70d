require 'rails_helper'
require 'spec_helper'

require 'rails_helper'
describe Creditcard do
  describe '#create' do

    it "customer_idがない場合は登録できないこと" do
      credit = build(:creditcard, customer_id: nil)
      credit.valid?
      expect(credit.errors[:customer_id]). to include("を入力してください")
    end

    it "card_idがない場合は登録できないこと" do
      credit = build(:creditcard, card_id: nil)
      credit.valid?
      expect(credit.errors[:card_id]). to include("を入力してください")
    end

    it "user_id(外部キー)がない場合は登録できないこと" do
      credit = build(:creditcard, user_id: nil)
      credit.valid?
      expect(credit.errors[:user]). to include("を入力してください")
    end
  end
end