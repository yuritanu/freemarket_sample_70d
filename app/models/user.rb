class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true
  validates :birthday, presence: true

  # validate :password_complexity
  # def password_complexity
  #   return if password.blank? || password =~ /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{7,70}$/
  #   errors.add :password, "パスワードの強度が不足しています。パスワードの長さは7〜70文字とし、英字と数字をそれぞれ1文字以上含める必要があります。"
  # end

  # has_one :profileaddress, dependent: :destroy

end
