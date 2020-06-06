# FactoryBot.define do
#   factory :image do
#     name { "images" }
#     product nil
#   end
# end
FactoryBot.define do

  factory :image do
    image   {File.open("#{Rails.root}/spec/fixtures/test_image.jpeg")}
    product
  end

end