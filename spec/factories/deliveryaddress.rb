FactoryBot.define do
  factory :deliveryaddress do
    family_name{"山田"}
    given_name{"太郎"}
    family_name_kana{"ヤマダ"}
    given_name_kana{"タロウ"}
    postal_code{"1111111"}
    prefectures{"北海道"}
    city{"根室"}
    address{"１−２−３"}
    building{"アパート１０４号"}
    phone_number{"09027281594"}
    user_id{}
  end
end