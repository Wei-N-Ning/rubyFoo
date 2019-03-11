def sequence
  (1..10).each do |i|
    yield i
  end
end

def demo_iteration
  sequence { |x| print x.to_s }
  print "\n"
end

demo_iteration
