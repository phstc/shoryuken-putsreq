require 'dotenv'
Dotenv.load

require_relative 'app/test_worker'

task :populate do
  1000.times do |index|
    TestWorker.perform_async(index.to_s)
  end
end

task :default => [:populate]
