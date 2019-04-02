#!/usr/bin/env ruby

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



