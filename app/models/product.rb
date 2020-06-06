class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_many :images, dependent: :destroy
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :delivery_day
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :images, presence: true, length: {manimum: 1, maximum: 10}
  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :category_id, :product_status_id, :delivery_cost_id, :shipping_origin_id, :delivery_day_id, presence: true
  validates :price, presence: true, inclusion: 300..9999999
end
