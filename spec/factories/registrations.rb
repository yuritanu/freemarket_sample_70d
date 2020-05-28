require 'factory_bot'

FactoryBot.define do
  factory :user_registration,class: User do
    nickname {"フリマ太郎"}
    email {"japanjapan@gmail"}
    password {"japanjapan12"}
    password_confirmation {"japanjapan12"}
    family_name {"田中"}
    given_name {"太郎"}
    family_name_kana {"タナカ"}
    given_name_kana {"タロウ"}
  end
  factory :user_registration_2,class: User do
    nickname {"フリマ太郎"}
    email {"japanjapan@gmail"}
    password {"japanjapan12"}
    password_confirmation {"japanjapan12"}
    family_name {"田中"}
    given_name {"太郎"}
    family_name_kana {"タナカ"}
    given_name_kana {"タロウ"}
    birthday{"2018-03-03"}
  end

  factory :profileaddress_registration, class: Profileaddress do
    postal_code{"2222222"}
    prefectures{"北海道"}
    city{"根室"}
    address{"１−２−３"}
    building{"アパート１０４号"}
    user_id{}
  end

  factory :deliveryaddress_registration, class: Deliveryaddress do
    family_name{"田中"}
    given_name{"太郎"}
    family_name_kana{"タナカ"}
    given_name_kana{"タロウ"}
    postal_code{"2222222"}
    prefectures{"北海道"}
    city{"根室"}
    address{"１−２−３"}
    building{"アパート１０４号"}
    phone_number{"09027281594"}
    user_id{}
  end
end