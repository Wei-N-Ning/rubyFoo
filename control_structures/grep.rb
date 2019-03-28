#!/usr/bin/env ruby

def simple_grep
  arr = %w/there is a xxx fat iddqd cow 123/
  p arr.grep(/(\w)\w\1/)
end

def main
  simple_grep()
end

main()



