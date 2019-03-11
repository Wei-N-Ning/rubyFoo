#!/usr/bin/env ruby

def demo
  username = `whoami`
  print username
  print `ls -l`

  # discouraged by IDE
  %x[who -a | perl -wnl -E '/\w+/ && say']
  usernames = `who -a | perl -wnl -E '/^\w+/ && say'`
  print usernames
end

demo
