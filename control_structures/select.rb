#!/usr/bin/env ruby

# source: udemy compr ruby prog s6l30
# recall perl's map {} and grep {}

def demo_select
  evens = (1..20).to_a.select { |x| x.even? }
  p evens

  # multiliner syntax applies too
  evens = (1..20).to_a.select do |x|
    x.even?
  end
  p evens
  
  # more compact (recommended) syntax for oneliner
  evens = (1..20).to_a.select(&:even?)
  p evens
end

def select_using_regex 
  words = %w(there is a cow)
  # recall perl's =~
  p words.select { |word| word =~ /T/ix }
end

demo_select()
select_using_regex()

