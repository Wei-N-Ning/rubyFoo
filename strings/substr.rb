#!/usr/bin/env ruby

# source
# ruby way 3rd P/102

def demo_substr_indexing
  text = 'set thereisacow'
  p [
    text[10, -1],  # substr length is negative
    text[4, 3],
    text[24, 2],  # out of bound
  ]

  # use negative indexing
  p [
    text[-4, 3], # normal order, but substr starts with [-4]
                 # recall slice() method uses the same calling 
                 # convention 
    text[-1, 234]  # shrink the substr length automatically
                   # slice() doesn't shrink
  ]

  # use range syntax
  p [
    text[1..4], 
    text[-4..-1], # equivalent to [-4, 4], inclusive, except 
                  # the end of substr is -1
  ]
end

def demo_substr_regex
  text = 'there is an cabbac silence where hath been abcc no sound'
  p [
    text[/\b[abc]+\b/],  # only returns the first match
    text[/doom/]
  ]
end

def demo_is_a_substr
  text = 'there is a silence where hath been no sound'
  p [
    text['here'],
    text['has']
  ]
end

def demo_substr_assignment
  text = 'there is a cow'
  text[-3..-1] = 'fat cow'  # cow -> fat cow
  p text
  text[/[th]+/] = "'H'm,./"
  p text
end

demo_substr_indexing
demo_substr_regex
demo_is_a_substr
demo_substr_assignment

