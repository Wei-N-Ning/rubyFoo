def demo_while_loop
  l = %w[there is a cow]
  i = 0
  while i < l.size
    print l[i].to_s, "\n"
    i += 1
  end
end

def demo_foreach
  l = %w[there is a cow]
  for x in l
    print x.to_s
  end
  print "\n"
end

# recap: udemy compr ruby prog s6l27
# iterable.each do |argument(s)|
def demo_each
  l = %w[there is a cow]
  l.each do |x|
    print x.to_s
  end
  print ' - '
  # this works for oneliner
  l.each { |x| print x }
  print "\n"
end

def for_numeric_range
  for i in 0..12 
    print i.to_s
  end
  print "\n"
end

# source: udemy compr ruby prog s2l8
def times_loop 
  nums = []
  10.times do
    nums.push(1)
  end
  p nums

  # to manipulate a global variable
  10.times do
    $global_var = 123
  end
  p $global_var
  # global var is bad; it does not have file scope
end

demo_while_loop
demo_foreach
demo_each
for_numeric_range
times_loop; p $global_var
