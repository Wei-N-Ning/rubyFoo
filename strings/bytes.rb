#!/usr/bin/env ruby

# source
# the ruby way 3rd, P/97

def print_as_bytes(text:)
  code_points = []
  text.each_byte { |byte| code_points.push sprintf '0x%X', byte }
  p code_points
end

def print_as_chars(text:)
  chars = []
  text.each_char { |c| chars.push c }
  p chars
end

def demo_bytes
  print_as_bytes(text: '12')
  print_as_bytes(text: '1，2')
  # ["0x31", "0x32"]
  #    1        2
  # ["0x31", "0xEF", "0xBC", "0x8C", "0x32"]
  #    1      ^^^^^^^^^^^^^^^^^^^^^     2  
  
  print_as_chars(text: '12')
  print_as_chars(text: '1，2')
  print_as_chars(text: '会え上お')
end

demo_bytes

