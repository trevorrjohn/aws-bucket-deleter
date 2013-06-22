require 'aws/s3'
require 'pry'

AWS::S3::Base.establish_connection!(
  access_key_id: ENV['AWS_S3_ACCESS_ID'],
  secret_access_key: ENV['AWS_S3_ACCESS_KEY']
)

@bucket_name = 'syphus-assets'
@buckets = AWS::S3::Bucket.find(@bucket_name)
