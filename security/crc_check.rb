#!/usr/bin/env ruby

# the cyclic redundancy check (CRC) is a well-known way of 
# obtaining a "signature" for a file or other collection of 
# bytes. The CRC has the property that the chance of data 
# being changed and keeping the same CRC is 1 in 2**N, where N
# is the number of bits in the result (most often 32 bits)

require 'zlib'

def demo_compute_crc
  text = 'there is a cow'
  puts Zlib::crc32(text)

  puts Zlib::crc32(('THERE is' + ' a COW').downcase)
end

demo_compute_crc



