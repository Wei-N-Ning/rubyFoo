#!/usr/bin/env ruby

# source
# ruby way 3rd P132/1832

def demo_noncapturing_groups
  text = '1n2i3n4g'
  p text.sub(/(1[a-z]+)/, "1r=#$1")
end

demo_noncapturing_groups


