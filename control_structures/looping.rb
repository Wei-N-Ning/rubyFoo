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

def demo_each
  l = %w[there is a cow]
  l.each do |x|
    print x.to_s
  end
  print "\n"
end

def for_numeric_range
  for i in 0..12 
    print i.to_s
  end
  print "\n"
end

demo_while_loop
demo_foreach
demo_each
for_numeric_range