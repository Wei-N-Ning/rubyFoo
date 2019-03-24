#!/usr/bin/env ruby

# source: udemy compr ruby prog s5l24

# device is an arg with default value
def compute(type:, value:, device: 'CPU') 
  return ["#{device}/#{type}", value * 10].join(' ')
end

def main 
  # p compute('dynamic', 231)  # error
  p compute(type: 'static', value: 231)
  # p compute()  # error, missing arg
  p compute(type: 'dynamic', value: 0x132, device: 'GPU')
end

main
