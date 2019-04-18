#!/usr/bin/env ruby

def demo_gsub
  text = 'there is aa cow, c'
  #         ^^^    ^^ ^^^^^^
  p [
    text.gsub(/(\w).*\1/, 'foo'),
  ]
end

demo_gsub
 