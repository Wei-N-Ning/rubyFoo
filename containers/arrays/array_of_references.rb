#!/usr/bin/env ruby

def create_arr_of_refs
  arr = Array.new(4, 'cow')
  p arr
  arr[3].upcase!
  p arr
end

def main
  create_arr_of_refs
end

main
