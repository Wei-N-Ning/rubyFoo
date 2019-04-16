#!/usr/bin/env ruby

# https://ruby-doc.org/core-2.2.0/Random.html

def demo_random(count:)
  nums = []
  (1..count).each do |_|
    nums.append(rand(count))
  end
  nums
end

p demo_random(count: 5)
