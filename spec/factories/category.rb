FactoryBot.define do
  factory :category do
    products {[
      FactoryBot.build(:product, category: nil)
    ]}
      id         {"1"}
      name       {"レディース"}
      ancestry   {"null"}
  end
end