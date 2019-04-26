#!/usr/bin/env ruby

# source
# ruby way 3rd, P224/1832
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
