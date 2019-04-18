#!/usr/bin/env ruby

def left_right_middle_justify
  text = 'iddqd'
  p text.ljust(20)
  p text.rjust(20)
  p text.center(20)
end

left_right_middle_justify
