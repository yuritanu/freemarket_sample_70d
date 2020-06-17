FactoryBot.define do
  factory :user do
    id       {"1"}
    nickname {"フリマ"}
    email{"japan@gmail"}
    password{"japan12"}
    password_confirmation{"japan12"}
    family_name{"山田"}
    given_name{"太郎"}
    family_name_kana{"ヤマダ"}
    given_name_kana{"タロウ"}
    birthday{20200523}
  end
end