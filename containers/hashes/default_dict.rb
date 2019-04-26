#!/usr/bin/env ruby

# source
# ruby way 3rd P246/1832

# motivation
# python has a default_dict construct that makes it convenient 
# to add element to an array in the dictionary/hashtable
# (no need to check for the existance of the key and initialize
# the array)

def default_dict
  dict = Hash.new([])
  p dict['maps']
  p dict
  begin
    p dict.fetch('maps') # can take an optional default value
  rescue IndexError => e
    p e
  end
  dict['maps'] = %w[e1m1 e1m2 e2m1 e3m4]
  p dict
end

def main
  default_dict
end

main
