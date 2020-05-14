class Profileaddress < ApplicationRecord
  belongs_to :user, optional: true
  # optional: true は外部キーがnullであることを許可するオプション
  
end
