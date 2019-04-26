#!/usr/bin/env ruby

# source
# ruby way 3rd P255/1832

# the module Enumerable has the requirement that the default 
# iterator each should be defined.
# Sequence as such is not an issue because even an unordered 
# collection can have an iterator.

# additionally if the methods min(), max() or sort() are to be 
# used, the collection must have a comparison method <=>

# an enumerable is just a collection that can be traversed and 
# thus searched, and then possibly sorted.
# as a rule of thumb, any user-defined collection that does not 
# subclass an existing core class should probably mix-in the 
# Enumerable module

# to iterate through a list and accumulate a result that changes 
# as we iterate. e.g. finding the sum of a list of numbers
# there is usually an accumulator of some kind (for which we 
# supply an initial value) and a function or operation we apply
def demo_inject_sum(arr, init: 0)
  arr.inject(init) do |result, elem|
    result + elem
  end
end

def main
  p demo_inject_sum([1, 2, 3, 5], init: -10)
end

main
