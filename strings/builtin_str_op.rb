#!/usr/bin/env ruby

# builtin string operators, manipulators
# source: udemy compr ruby prog s3l11

def change_case
  puts 'there is acow'.upcase
  puts 'ASCU'.downcase
  
  # inplace case changing
  # the bang (exclamation mark) version is useful as it can  
  # return an error status in dev version for debugging purpose
  text = 'there is acow'
  p(['first try', text.upcase!])
  p(['second try', text.upcase!])  # return nil
end

def reversing
  puts 'there is a cow'.reverse
end

def substitution
  # sub the first occurrance from left
  puts 'there is a cow'.sub('e', 'E')
  # sub all (global sub)
  puts 'there is a cow'.gsub('e', 'E')

  # inplace
  text = 'there'
  # this also shows ruby's expression evaluation order
  p [text.gsub!('e', 'E'), text] 
end

def splitting
  # see also strip
  # ruby's split in perl:
  # perl -E "$,='|'; say grep {/\S+/} split /\s+/, '   there    is  a  c ow   '"
  p '   there    is  a  c ow   '.split()

  p 'thereisacow'.split('').map(&:upcase)
end

change_case
reversing
substitution
splitting
