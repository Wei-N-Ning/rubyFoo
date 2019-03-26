#!/usr/bin/env ruby

def try_except
  begin
    raise ArgumentError, 'basd'
  rescue ArgumentError => e
    puts "ArgumentError: #{e}"
  rescue StandardError => e
    puts "default error handler: #{e}"
  end
end

def main
  try_except()
end

main()

