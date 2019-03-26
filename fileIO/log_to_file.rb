#!/usr/bin/env ruby

def logthis(message:)
  File.open('/var/tmp/acow', 'a') do |fp|
    fp.puts("#{Time.new}: #{message}")
  end
end

def main
  logthis(message: "there isa cow")
  logthis(message: "...")
end

main()
