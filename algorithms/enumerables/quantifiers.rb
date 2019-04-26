#!/usr/bin/env ruby

# ruby way 3rd P257/1832
# recall python's all, any of list class

def all_any(arr, proc)
  p ['any', arr.any?(proc)]
  p ['all', arr.all?(proc)]
end

def main
  all_any(
    [1, 2, 3, 5],
    Proc.new do |elem|
      elem % 2 == 0
    end
  )
end

main
