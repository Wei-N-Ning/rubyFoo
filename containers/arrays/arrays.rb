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

# source
# https://stackoverflow.com/questions/1801516/how-do-you-add-an-array-to-another-array-in-ruby-and-not-end-up-with-a-multi-dim
def demo_extend
  nums = [3, 1, 4]
  nums.concat [1]
  nums + [5]
  nums.append(*[9, 2, 6])
  nums.append(5, 3, 5)
  p 'extended:', nums
end

# array slice is a method in ruby (unlike in Python or Perl)
def demo_slice
  arr = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]
  # last N elements
  last_n = 5
  p 'last 5 elements', arr.slice(-last_n, last_n)

  # ruby does not automatically shrink the last N elements to
  # fit the array length
  last_n = 45
  last_n = arr.length < last_n ? arr.length : last_n
  p 'manually shrink last_n to fit array length', 
    arr.slice(-last_n, last_n)
end

def demo_comparison_lt_gt
  # see live example in CA infra-tools release.rb
  [2] <=> [1]  # returns -1, 0, 1
  # source
  # http://www.java2s.com/Code/Ruby/Array/comparearraysiswithspaceshipoperator.htm

  p [
    [2] <=> [1],   # 1 greater
    [1] <=> [1],   # 0 equal
    [2] <=> [10],  # -1 less
  ]
end

size_test
demo_array_creation
delete_elements_by_value
delete_if
do_join
push_and_pop
demo_extend
demo_slice
demo_comparison_lt_gt
