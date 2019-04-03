#!/usr/bin/env ruby

# select vs. grep
# https://www.rubyguides.com/2018/10/grep-method-with-examples/

# grep()
# The trick is with the === method (triple equals) in Ruby.
# Grep calls this method on whatever argument you pass to it.
# And it turns out that classes, regular expressions & ranges all implement ===.
# They implement this method in a way that makes sense for the class.

# select()
# The select method filters a list based on the results of the block.

# You could say that grep is a more specialized version of select!


def simple_grep
  arr = %w[there is a xxx fat iddqd cow 123]
  # grep returns an array
  p arr.grep(/(\w)\w\1/)
  p arr.grep(/zz/)  # empty array
  p [].grep(/zz/)
end

def main
  simple_grep()
end

main()



