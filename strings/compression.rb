#!/usr/bin/env ruby

require 'zlib'

def demo_deflation
  text = 'there is a cow' * 1337
  puts text.length
  fatest = Zlib::Deflate.deflate(text, Zlib::BEST_SPEED)
  puts fatest.dump
  puts fatest.length
  best = Zlib::Deflate.deflate(text, Zlib::BEST_COMPRESSION)
  puts fatest.length
end

demo_deflation



