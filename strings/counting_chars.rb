#!/usr/bin/env ruby

def counting_characters
  text = 'there is a cow'
  #             ^^   ^
  puts text.count('isc')

  # use negate
  puts text.count('^thereisaco ')

  # use range
  puts text.count('a-d')  # a, c
end

counting_characters


