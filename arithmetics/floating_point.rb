#!/usr/bin/env ruby

def demo_rounding
  pi = 3.14159
  puts pi.round # to int
  puts pi.round(4)

  puts pi.round_down_1(4)
  puts pi.round_down_2(4)
end

# ruby (2.6) has no built-in rounding-down method
# source:
# https://stackoverflow.com/questions/7090537/a-way-to-round-floats-down
class Float
  def round_down_1(number)
    s = to_s
    l = s.index('.') + 1 + number
    s.length <= l ? self : s[0, l].to_f
  end

  def round_down_2(number)
    number < 1 ? to_i.to_f : (self - 0.5 / 10**number).round(number)
  end
end

# define AlmostEqual() method for float
# source:
# ruby way 3rd P170/1832
class Float
  def almost_equal?(other, tolerance: 1e-7)
    (self - other).abs < tolerance
  end
end

def demo_almost_equal
  puts 3.1415926535897.almost_equal?(3.1415926535)
  puts 3.1415926535897.almost_equal?(3.14)
end

def main
  demo_rounding
  demo_almost_equal
end

main
