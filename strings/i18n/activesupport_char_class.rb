#!/usr/bin/env ruby

# source
# ruby way 3rd, P153/1832

require 'active_support'

def demo_change_case
  # the built-in String class in ruby 2.6.0 allows unicode case-changing 
  text = "\u00E9\u00E9\u00E9\u00E9"
  atext = ActiveSupport::Multibyte::Chars.new(text)
  p [text.downcase, text.upcase]
  puts [atext.downcase, atext.upcase]
  text = 'あえお'
  atext = ActiveSupport::Multibyte::Chars.new(text)
  p [text.downcase, text.upcase]
  puts [atext.downcase, atext.upcase]
end

def main
  demo_change_case
end

main