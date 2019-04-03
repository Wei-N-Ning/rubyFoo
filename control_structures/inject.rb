#!/usr/bin/env ruby

def array_sum_x2
  nums = [3, 1, 4, 1, 5, 9, 2, 6]
  # + is a method
  nums.inject(&:+) + \
  nums.inject {|sum, x| sum + x}
end

p array_sum_x2()
