require 'shoryuken'

class TestWorker
  include Shoryuken::Worker

  shoryuken_options queue: 'default', auto_delete: true

  def perform(sqs_msg, index)
    uri = URI("http://putsreq.com/7WzifsM2tgkiy4Xpaj26?index=#{index}")
    Net::HTTP.get(uri)
  end
end
