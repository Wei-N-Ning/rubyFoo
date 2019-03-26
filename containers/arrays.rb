def demo_array_creation
  nums = [1, 2, 3]
  mixed = [1, 2, 'string']
  words = %w[ad bc]

  # these also work
  # recap in udemy compr ruby prog s6l30
  # %w(...), %w/.../, %w(...)

  puts "#{nums} #{mixed} #{words}"
end

demo_array_creation
