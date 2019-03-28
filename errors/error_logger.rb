#!/usr/bin/env ruby

def error_logger(err)
  File.open('/var/tmp/error_logger.txt', 'a') do |fp|
    fp.puts(err)
  end
end

begin 
  puts nil + 10
rescue StandardError => e
  error_logger("ERROR [#{Time.new}]: #{e}")
end

