#!/usr/bin/env ruby

# source: udemy compr ruby prog s5l21

# define a proc
def create_proc
  # oneliner uses {}
  # return Proc.new { |lhs, rhs| lhs * rhs }

  # multiliner uses do/end
  return Proc.new do |lhs, rhs|
    lhs * rhs
  end
end

# two ways of invoking a proc
def use_proc
  proc = create_proc
  p proc[10, 3]
  p proc.call(10, 3)
end

use_proc

