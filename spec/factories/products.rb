FactoryBot.define do
  factory :product do

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
    # user { create(:user) }
    # buyer {}
    user
    after(:build) do |product|                           #追記
      product.images << build(:image, product: product)  #追記
      end                  
    end
  end

#   factory :product_with_image, class: Product do
#     name  { "images" }

#     after( :create ) do |product|
#       create :image, product: product
#   end
# end