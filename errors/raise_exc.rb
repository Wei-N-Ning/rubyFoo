#!/usr/bin/env ruby

# note: to capture keyword interruption (Ctrl + C), do
# begin
#   exit unless gets.chomp =~ /[yY]/
# rescue Interrupt
#   puts ''
#   exit
# end

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

