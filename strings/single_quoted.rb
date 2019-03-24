#!/usr/bin/env ruby
# the ruby way 3rd P/93
# single quoted string is taken absolutely literally;

def main
  s1 = 'there is acow'
  s3 = ' \'there is cow\''
  s2 = 'c:\format'
  print(s1, s2, s3, "\n")
end

main
