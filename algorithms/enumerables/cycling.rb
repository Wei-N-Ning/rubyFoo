#!/usr/bin/env ruby

# ruby way 3rd P/262

def demo_cycle_through(arr, kill_count:)
  text = ':'
  arr.cycle.with_index do |elem, index|
    break if index > kill_count
    text += elem.to_s
  end
  text
end

def main
  arr = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
  p demo_cycle_through(arr, kill_count: 30)
end

main
