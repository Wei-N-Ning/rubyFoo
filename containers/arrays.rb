#!/usr/bin/env ruby

def size_test
  p [[].empty?, [1].empty?]
end

def demo_array_creation
  nums = [1, 2, 3]
  mixed = [1, 2, 'string']
  words = %w[ad bc]  # IDE recommends []

  # holes in the middle, presented as nil(s)
  empty = Array.new; empty[0] = 1; empty[10] = 10; p empty

  # these also work
  # recap in udemy compr ruby prog s6l30
  # %w(...), %w/.../, %w(...)

  puts "#{nums} #{mixed} #{words}"
end

def delete_elements_by_value 
  nums = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, '', '', '&', '&', '&']
  p nums
  # delete all the elements that hold value 1 and ''
  nums.delete(1); nums.delete('')
  p nums
  # remove elements holding value 3, 4 or '&' from the array
  # note that produces a temporary array instead of modifying
  # the operand
  p nums - [3, 4, '&']

  # delete_at() will delete the element at position x and 
  # return the value to lhs
  puts "deleted #{nums.delete_at(0)}; after: #{nums}"
end

def delete_if
  nums = [3, 1, 4, 1, 5, 9, 2, 6]
  # inject {|sum, x| sum + x}
  # https://apidock.com/ruby/Enumerable/inject
  avg = nums.inject(&:+) / Float(nums.length)
  nums.delete_if{|x| x < avg}
  p avg, nums
end

def do_join
  nums = [3, [999, 1000], 1, 4, 1, 5, 9, 2, 6]
  # join implicitly does to_s
  # also flattens the nested array
  puts nums.join('.')
end

def push_and_pop
  nums = [3, 1, 4, 1, 5, 9, 2, 6]
  # push multiple elements via *args
  nums.push(*%w[there is a cow])
  p nums
  nums.pop()
  p nums
end

size_test
demo_array_creation
delete_elements_by_value
delete_if
do_join
push_and_pop
