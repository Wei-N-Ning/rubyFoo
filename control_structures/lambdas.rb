#!/usr/bin/env ruby

# source: udemy compr ruby prog s5l22
# lambda is not proc

# see s5l23 for the difference between procs and lambdas

# 1. lambda has signature check: passing 3 args while the lambda
#  only requires 2 results in an error; proc will ignore the 
#  additional arguments

# 2. lambda return is to return the value to the caller
#    proc return is to return in the defining context

def demo_lambda
  fun = ->(lhs, rhs) {
    # I can use return in lambda, but not in Proc; the latter
    # will cause the calling block to return 
    return [lhs.to_s, rhs.to_s].join(' ')
  }
  p fun[40, 'thieves']
end

def demo_lambda_as_iterator
  # can not define local iterator using lambda?
  # no block given (yield) (LocalJumpError)
  iter = ->(lower, upper) {
    for elem in lower..upper do
      yield elem
    end
  }
  arr = []; p iter[3, 14]
end

demo_lambda
demo_lambda_as_iterator
