class Profileaddress < ApplicationRecord
  belongs_to :user, optional: true
  # optional: true は外部キーがnullであることを許可するオプション

  validate :zipcode
  # 郵便番号のバリデーション（ハイフンなし７桁）↑
  validate :full_width_city
  validate :full_width_address
  validate :full_width_building
  # 全角のみ入力設定（半角ではない設定）↑
  def zipcode
    return if postal_code.blank? || postal_code =~ /\A\d{7}\z/
    @error_name = I18n.t(User.human_attribute_name(:postal_code))
    # ja.ymlからデータを引っ張ってきている↑
    errors.add @error_name, "は不当な値です。ハイフンなし、７桁の番号で入力してください"
  end

  def full_width_city
    return if city.blank? || city =~ /[^ -~｡-ﾟ]/
    @error_name = I18n.t(User.human_attribute_name(:city))
    errors.add @error_name, "は全角で入力してください"
  end
  def full_width_address
    return if address.blank? || address =~ /[^ -~｡-ﾟ]/
    @error_name = I18n.t(User.human_attribute_name(:address))
    errors.add @error_name, "は全角で入力してください"
  end
  def full_width_building
    return if building.blank? || building =~ /[^ -~｡-ﾟ]/
    @error_name = I18n.t(User.human_attribute_name(:building))
    errors.add @error_name, "は全角で入力してください"
  end

  enum prefecture:{
    ーーー:0,北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
  
end
