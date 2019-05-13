def power(exponent)
  proc { |base| base**exponent }
end

def make_sentence(name:)
  proc { |said| print "\n#{name} says, #{said}\n" }
end

def demo
  square = power(2)
  cube = power(3)
  print square.call(23).to_s
  print cube.call(12).to_s

  sentence_maker = make_sentence(name: 'cow')
  sentence_maker.call('there is a cow')
end

demo
