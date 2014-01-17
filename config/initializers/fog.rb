# Adding Amazon S3 to Carrierwave
#CarrierWave.configure do |config| 
  #config.fog_credentials = { 
    #:provider               => 'AWS', 
    #:aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'], 
    #:aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'] 
  #} 
 # config.fog_directory  = ENV['AWS_BUCKET']
 # config.fog_public     = false 
# end 

# Ref:
# https://support.cloud.engineyard.com/entries/20996881-Use-CarrierWave-and-Optionally-Fog-to-Upload-and-Store-Files#update3
# http://stackoverflow.com/questions/7946819/carrierwave-and-amazon-s3

CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV['S3_BUCKET_NAME']
  config.aws_acl    = :public_read
#  config.asset_host = 'http://example.com'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
end