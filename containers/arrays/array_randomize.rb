#!/usr/bin/env ruby

def demo_randomization
  arr = %w[set a = there is a cow 1337 ]
  p [arr, arr.shuffle]
end

def main
  demo_randomization
end

main
