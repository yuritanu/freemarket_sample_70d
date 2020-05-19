class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,password_length: 7..128
         
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true
  validates :birthday, presence: true
  
  has_one :profileaddress, dependent: :destroy
  has_one :deliveryaddress, dependent: :destroy

  # パスワード英字数字１文字かつ７文字以上のバリデーション↓
  validate :password_complexity
  # 全角のバリデーション↓
  validate :name_em
  validate :name_kana_em
  # メールアドレスのバリデーション↓
  validate :valid_email?


  def valid_email?
    return if email.blank? || email =~ /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
  end
  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{7,70}$/

    errors.add :password, "は英字と数字をそれぞれ1文字以上含める必要があります"
  end

  def name_em
    if !(family_name =~ /^[ぁ-んァ-ン一-龥]/)
      if !(given_name =~ /^[ぁ-んァ-ン一-龥]/)
        errors.add :family_name, "は全角で入力してください"
        errors.add :given_name, "は全角で入力してください"
      else
        errors.add :family_name, "は全角で入力してください"
      end
    elsif !(given_name =~ /^[ぁ-んァ-ン一-龥]/)
      errors.add :given_name, "は全角で入力してください"
    else
      return
    end
  end

  def name_kana_em
    if !(family_name_kana =~ /^([ァ-ン]|ー)+$/)
      if !(given_name_kana =~ /^([ァ-ン]|ー)+$/)
        errors.add :family_name_kana, "は全角カタカナで入力してください"
        errors.add :given_name_kana, "は全角カタカナで入力してください"
      else
        errors.add :family_name_kana, "は全角カタカナで入力してください"
      end
    elsif !(given_name_kana =~ /^([ァ-ン]|ー)+$/)
      errors.add :given_name_kana, "は全角カタカナで入力してください"
    else
      return
    end
  end
end
