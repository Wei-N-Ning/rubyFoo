#!/usr/bin/env ruby

# ruby way 3rd P257/1832

def demo_partition(arr)
  s = arr.partition { |elem| elem > 5 }
  p s
end

def demo_group_by(arr)
  s = arr.group_by { |elem| elem % 5 }
  p s
end

def iterate_by_groups(arr, chunk_size)
  arr.each_slice(chunk_size) do |chunk|
    p chunk
  end
end

def main
  arr = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8]
  demo_partition(arr)
  demo_group_by(arr)
  iterate_by_groups(arr, 4)
end

main
