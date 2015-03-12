require 'dotenv'
Dotenv.load

require_relative 'app/test_worker'

task :populate do
  # 1000.times do |index|
    # TestWorker.perform_async(index.to_s)
  # end
  (0...1000).to_a.each_slice(10) do |group|
    Shoryuken::Client.queues('default').send_messages(entries: group.map { |item| { id: SecureRandom.hex, message_body: item.to_s } })
  end
end

task :default => [:populate]
