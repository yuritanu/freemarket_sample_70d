class Product < ApplicationRecord
  has_many :pictures, dependent: :delete_all
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
