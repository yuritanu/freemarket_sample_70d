FactoryBot.define do
  factory :product do
    user
    category

    id {"1"}
    name {"バッグ"}
    explanation {"ビンテージもの"}
    category_id {"1"}
    brand {"ルイヴィトン"}
    product_status_id {"2"}
    delivery_cost_id {"1"}
    shipping_origin_id {"5"}
    delivery_day_id {"2"}
    price {"3000"}
    user_id {"1"}
    buyer {}
    after(:build) do |product|
      product.images << build(:image, product: product)
      end                  
    end
  end
