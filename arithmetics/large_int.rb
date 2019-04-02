#!/usr/bin/env ruby

# source: udemy compr ruby prog s4l14
# motivation produce a really large integer

# ruby -e 'p 0xF**0x1F'
# perl -E 'say 0xF**0x1F'
# 2876265888493261300027370452880859375
# ruby wins

def really_large_int
  0xF**0x1F
end

p really_large_int
