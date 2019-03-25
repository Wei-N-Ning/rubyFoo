#!/usr/bin/env ruby

# source: udemy compr ruby prog s6l30
# recall perl's map {} and grep {}

def demo_select
  evens = (1..20).to_a.select { |x| x.even? }
  # multiliner syntax applies too
  p evens
end

demo_select()
