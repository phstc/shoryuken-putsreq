require 'shoryuken'

class TestWorker
  include Shoryuken::Worker

  shoryuken_options queue: 'default', auto_delete: true

  def perform(sqs_msg, index)
    uri = URI("#{ENV['BUCKET_URL']}?index=#{index}")
    Net::HTTP.get(uri)
  end
end
