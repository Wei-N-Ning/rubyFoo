#!/usr/bin/env ruby

# ruby way 3rd P/259

# internal iteration: each_line {}
# ext iteration: getline(); ...

def demo_ext_iterate(iter)
  text = ':'
  loop do # implicitly catching StopIteration
    text += iter.next.to_s # raises StopIteration
  end
  iter.rewind # reset the internal state to the beginning
  text += ':'
  loop { text += iter.next.to_s } # compact form
  text
end

def main
  arr = [3, 1, 4, 1, 5]
  p demo_ext_iterate(arr.each)
end

main
