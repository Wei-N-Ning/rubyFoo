#!/usr/bin/env ruby

# use nested heredoc
# motivation:
# ruby eval does not understand __END__ data section
# see:
# https://www.reddit.com/r/ruby/comments/93d5li/how_can_i_use_end_with_erb/
# this means I can not use __END__ in-code data with certain
# ruby frameworks such as Homebrew

$DATA = <<"HAHA"
#!/usr/bin/env bash
HH=$(cat <<"TEXT"
asd
TEXT
)
echo "${HH}"
perl -wnl -E 'say $1 if /,\\s+(\\w+)\\b/'
HAHA

def demo_print_herestr
  $DATA.each_line { |l| puts l }
end

demo_print_herestr
