#!/usr/bin/env ruby

# ruby way 3rd P/94

# similar to double quoted string
def interpretated
  print(<<STR1, <<STR2)
there \tis
th tere \nis
STR1
a cow
acow
   cow
STR2
end

def uninterpretated
  print(<<'STR1', <<'STR2')
\t\n
STR1
\\ \\
STR2
end

def indent
  print(<<-TEXT)
    asd
    bsd
  TEXT
end

interpretated
uninterpretated
indent
