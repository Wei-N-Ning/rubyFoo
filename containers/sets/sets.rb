#!/usr/bin/env ruby

# ruby way 3rd P259/1832

require 'set'

def create_set_from_array(arr)
  arr.to_set
end

def main
  arr = [3, 1, 4, 1, 5]
  p create_set_from_array(arr)
end

main
