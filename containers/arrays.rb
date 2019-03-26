def demo_array_creation
  nums = [1, 2, 3]
  mixed = [1, 2, 'string']
  words = %w[ad bc]

  # holes in the middle
  empty = Array.new; empty[0] = 1; empty[10] = 10; p empty

  # these also work
  # recap in udemy compr ruby prog s6l30
  # %w(...), %w/.../, %w(...)

  puts "#{nums} #{mixed} #{words}"
end

def delete_elements_by_value 
  nums = [3, 1, 4, 1, 5, 9, 2, 6, '', '']
  p nums
  nums.delete(1); nums.delete('')
  p nums

  # delete_at() will delete the element at position x and 
  # return the value to lhs
end

def delete_if
  nums = [3, 1, 4, 1, 5, 9, 2, 6]
  avg = nums.inject(&:+) / Float(nums.length)
  nums.delete_if{|x| x < avg}
  p avg, nums
end

def do_join
  nums = [3, 1, 4, 1, 5, 9, 2, 6]
  puts nums.join('.')  # join implicitly does to_s
end

def push_and_pop
  nums = [3, 1, 4, 1, 5, 9, 2, 6]
  # push multiple elements via *args
  nums.push(*%w/there is a cow/)
  p nums
  nums.pop()
  p nums
end

demo_array_creation
delete_elements_by_value
delete_if
do_join
push_and_pop



