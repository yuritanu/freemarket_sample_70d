require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  # if Rails.env.production? || Rails.env.development?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      # aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      # aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],

      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'teamd70'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/teamd70'
    config.fog_public = false

  # else
  #   config.storage :file # 開発環境:public/uploades下に保存
  #   config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  # end  
end