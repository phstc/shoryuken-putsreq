require 'dotenv'
Dotenv.load

require_relative 'test_worker'

task :populate do
  started_at = Time.now
  1000.times do |index|
    TestWorker.perform_async(index.to_s)
    # Shoryuken::Client.queues('default').send_message(message_body: index.to_s)
  end
  puts "Total time: #{(Time.now - started_at) * 1000}ms"

  # (0...1000).to_a.each_slice(10) do |group|
  # Shoryuken::Client.queues('default').send_messages(entries: group.map { |item| { id: SecureRandom.hex, message_body: item.to_s } })
  # end
end

task :create_queue do
  Shoryuken::Client.sqs.create_queue queue_name: 'default'
end

task :queue_size do
  puts "approximate_number_of_messages: #{Shoryuken::Client.queues('default').approximate_number_of_messages}"
end

task :default => [:populate]
