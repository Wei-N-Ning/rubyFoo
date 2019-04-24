#!/usr/bin/env ruby

=begin
naturally a reg ex is match against a string in a 
linear fashion (with backtracing as necessary), 
therefore there is the concept of the current 
loccation in the string - rather like a file 
pointer or a cursor

the term lookahead refers to a construct that 
matches a part of the string ahead of the curr
location 

it is a zero-width assertion because even when a match succeeds, 
no part of the string is consumed (that i the current location 
does not change)
=end

def demo_positive_lookahead
  texts = [
    'there is a cow 1337',
    'there is a cow',
    'there is a cow = 1337',
    'fat cow 0x2048'
  ]
  texts.each do |text|
    puts 'pos: ' + text if text.match(/cow\s+(?=0x)/)
  end

  texts.each do |text|
    # /cow\s+(?!\d+)/ will match cow  2048
    puts 'neg: ' + text if text.match(/cow\s+(?!\d+)/)
  end
end

demo_positive_lookahead

