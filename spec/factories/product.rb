FactoryBot.define do
  factory :product do

    id {10}
    name {"ズボン"}
    explanation {"ビンテージもの"}
    category_id {2}
    brand {0}
    product_status_id {1}
    delivery_cost_id {1}
    prefecture_id {1}
    delivery_day_id {2}
    price {"3000"}
    user_id {1}
    buyer {}
    association :user, factory: :user

    end
end