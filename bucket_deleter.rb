require 'aws/s3'
require 'pry'

AWS::S3::Base.establish_connection!(
  access_key_id: ENV['AWS_S3_ACCESS_ID'],
  secret_access_key: ENV['AWS_S3_ACCESS_KEY']
)

@bucket_name = ''
@buckets = AWS::S3::Bucket.find(@bucket_name)

while @buckets.any?
  begin
    puts "Deleting objects in bucket"

    @buckets.objects.each do |item|
      item.delete
      puts "There are #{ @buckets.objects.size } objects left in the bucket"
    end

    puts "Done deleting objects"
  rescue SocketError
    puts "Had socket error"
  end
end
