#!/usr/bin/env ruby

def demo
  username = `whoami`
  puts username.chomp
  puts `ls -l`.chomp

  # discouraged by IDE
  %x[who -a | perl -wnl -E '/\w+/ && say']

  usernames = `who -a | perl -wnl -E '/^\w+/ && say'`.chomp
  puts usernames

  `who -a | perl -wnl -E '/^\w+/ && say'`.each_line do |line|
    # line carries a trailing newline (should call chomp)
    p line
  end
end

demo
