class Deliveryaddress < ApplicationRecord
  # validates :family_name, presence: true
  # ↑のようにバリデーションすると日本語化できないので↓のメソッドでバリデーションしてます

  belongs_to :user,optional: true

  # 全角(＆空白)のバリデーション↓
  validate :name_em
  validate :name_kana_em

  # 決まった桁の数字を入力するバリデーション↓
  validate :zipcode
  validate :phone_number_check

  # 全角のみ入力設定（半角ではない設定）↓
  validate :full_width_city
  validate :full_width_address
  validate :full_width_building
  

  enum prefecture:{
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

  def name_em
    @error_name1 = I18n.t(User.human_attribute_name(:family_name))
    @error_name2 = I18n.t(User.human_attribute_name(:given_name))
    if !(family_name =~ /^[ぁ-んァ-ン一-龥]/)
      if !(given_name =~ /^[ぁ-んァ-ン一-龥]/)
        errors.add @error_name1, "は全角で入力してください"
        errors.add @error_name2, "は全角で入力してください"
      else
        errors.add @error_name1, "は全角で入力してください"
      end
    elsif !(given_name =~ /^[ぁ-んァ-ン一-龥]/)
      errors.add @error_name2, "は全角で入力してください"
    else
      return
    end
  end

  def name_kana_em
    @error_name3 = I18n.t(User.human_attribute_name(:family_name_kana))
    @error_name4 = I18n.t(User.human_attribute_name(:given_name_kana))
    if !(family_name_kana =~ /^([ァ-ン]|ー)+$/)
      if !(given_name_kana =~ /^([ァ-ン]|ー)+$/)
        errors.add @error_name3, "は全角カタカナで入力してください"
        errors.add @error_name4, "は全角カタカナで入力してください"
      else
        errors.add @error_name3, "は全角カタカナで入力してください"
      end
    elsif !(given_name_kana =~ /^([ァ-ン]|ー)+$/)
      errors.add @error_name4, "は全角カタカナで入力してください"
    else
      return
    end
  end

  def phone_number_check
    return if phone_number.blank? || phone_number =~ /\A\d{10,11}\z/
    @error_name5 = I18n.t(User.human_attribute_name(:phone_number))
    errors.add @error_name5, "は不当な値です。ハイフンなし、10桁,又は11桁の番号で入力してください"
  end

  def zipcode
    return if postal_code =~ /\A\d{7}\z/
    @error_name6 = I18n.t(User.human_attribute_name(:postal_code))
    errors.add @error_name6, "はハイフンなし、７桁の数字で入力してください"
  end

  def full_width_city
    if city.blank? 
      @error_name7 = I18n.t(User.human_attribute_name(:city))
      errors.add @error_name7, "は全角で入力してください"
    elsif !(city =~ /^[^ -~｡-ﾟ]*$/)
      @error_name7 = I18n.t(User.human_attribute_name(:city))
      errors.add @error_name7, "は全角で入力してください"
    else
      return
    end
  end

  def full_width_address
    if address.blank?
      @error_name8 = I18n.t(User.human_attribute_name(:address))
      errors.add @error_name8, "は全角で入力してください"
    elsif !(address =~ /^[^ -~｡-ﾟ]*$/)
      @error_name8 = I18n.t(User.human_attribute_name(:address))
      errors.add @error_name8, "は全角で入力してください"
    else
    end
  end
  def full_width_building
    return if building.blank? || building =~ /^[^ -~｡-ﾟ]*$/
    @error_name9 = I18n.t(User.human_attribute_name(:building))
    errors.add @error_name9, "は全角で入力してください"
  end
end
