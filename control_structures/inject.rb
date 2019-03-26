#!/usr/bin/env ruby

def array_sum
  nums = [3, 1, 4, 1, 5, 9, 2, 6]
  nums.inject(&:+)  # + is a method
end

p array_sum()
