#!/usr/bin/env ruby

# source
# ruby way 3rd P/102

def demo_swapcase
  text = 'iddqd_IDKFA'
  text.swapcase!
  p text
  p [text.swapcase, text]

end

def demo_caseless_cmp
  ''.casecmp('')
end

demo_swapcase
demo_caseless_cmp


