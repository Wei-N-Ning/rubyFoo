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

def demo_iteration
  sequence { |x| print x.to_s }
  print "\n"

  iter = Iteratable.new(from: 1, to: 10)
  iter.each do |x|
    print x.to_s
  end
  print "\n"
end

demo_iteration
