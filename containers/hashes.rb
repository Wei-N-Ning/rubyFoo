def demo_hash_creation
  num_by_num = { 1 => 1, 2 => 4 }
  nums_by_num = { 1 => %w[there is], 2 => %w[a cow] }
  value_by_symbol = { a: 1, b: 2 }
  puts "#{num_by_num} #{nums_by_num} #{value_by_symbol}"
  puts value_by_symbol[:a]
end

demo_hash_creation





