def demo_hash_creation
  num_by_num = { 1 => 1, 2 => 4 }
  nums_by_num = { 1 => %w[there is], 2 => %w[a cow] }
  value_by_symbol = { a: 1, b: 2 }
  puts "#{num_by_num} #{nums_by_num} #{value_by_symbol}"
  puts value_by_symbol[:a]

  # modern hash syntax
  level = {name: 'hells gate', code: 'e1m1'}
  p level[:name]  # require :key when accessing
end

def delete_element
  level = {name: 'hells gate', code: 'e1m1'}
  # delete() returns the value 
  p level.delete(:name), level
end

def iterate_key_value
  level = {name: 'hells gate', code: 'e1m1'}
  
  p level.each_key.to_a
  # each_key do |x|
  # end
  p level.each_value.to_a
end

demo_hash_creation
delete_element
iterate_key_value




