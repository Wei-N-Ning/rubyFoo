#!/usr/bin/env ruby

def if_equality
  x = 10; y = 10
  if x == y
    ret = 1
  else 
    ret = 0
  end
end

# recall perl's unless 
# if, unless can be used as expression modifier (recall perl)
# even "elsif" is borrowed from perl
def unless_equality
  x = 10; y = 10
  unless x == y  # if x != y
    ret = 0
  else 
    ret = 1
  end
end

p if_equality
p unless_equality


