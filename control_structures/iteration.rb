def sequence
  (1..10).each do |i|
    yield i
  end
end

# Demo iteration via .each method
class Iteratable
  def initialize(from:, to:)
    @from = from
    @to = to
  end

  # Any class having this iterator can be walked through with a 
  # for loop
  def each
    (@from..@to).each do |x|
      yield x
    end
  end
end

def demo_function_as_iterator
  sequence { |x| print x.to_s }  # short syntax
  print "\n"
  
  arr = []; sequence do |elem|  # long syntax
    arr.push(elem)
  end
  p arr
end

def demo_object_as_iterator
  iter = Iteratable.new(from: 1, to: 10)
  iter.each do |x|
    print x.to_s
  end
  print "\n"

  # use for..in control structure
  arr = []
  for elem in Iteratable.new(from: 1, to: 10)
    arr.push(elem)
  end
  p arr
end

def main
  demo_function_as_iterator
  demo_object_as_iterator
end

main
