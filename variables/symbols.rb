#!/usr/bin/env ruby

# see:
# https://stackoverflow.com/questions/75759/enums-in-ruby

module Foo
  BAR = 1
  BAZ = 2
  BIZ = 4
end

# some directions
class Direction
  NORTH = 0x10
  SOUTH = 0x11
end

def symbols_as_enumerations
  puts Foo::BAR
  puts Direction::NORTH
end

def main
  symbols_as_enumerations
end

main
