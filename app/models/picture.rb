class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product
end
# imageモデルの代わりに作成したpictureモデルです。後々削除予定。