#!/usr/bin/env ruby

def demo_back_references
  text = 'there is a cow'
  if text =~ /\b(th\w+)\b/
    puts "#{$1}"
  end
  if text =~ /\b(co\w)\b/
    puts "#{$1}"
  end
end

demo_back_references



