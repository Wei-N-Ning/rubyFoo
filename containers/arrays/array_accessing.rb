#!/usr/bin/env ruby

# ruby way 3rd P224/1832
def first_last(arr)
  p [arr.first, arr.last]
end

def values_at(arr, *expr)
  p arr.values_at(*expr)
end

def main
  first_last([1, 3, 2])
  first_last([1])
  first_last([]) # [nil, nil]
  values_at(%w[there is a cow], 0..1, 5)
end

main
