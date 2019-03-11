def demo_array_creation
  nums = [1, 2, 3]
  mixed = [1, 2, 'string']
  words = %w[ad bc]

  # %w/.../, %w(...)

  print "#{nums} #{mixed} #{words}"
end

demo_array_creation
