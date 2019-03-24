#!/usr/bin/env ruby

def main
  str1 =<<TEXT
there 
is a 
cow
TEXT
  str1.each_line.with_index do |line, num|
    print("#{num + 1}: #{line}")
  end
end

main
