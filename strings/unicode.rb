#!/usr/bin/env ruby

# source
# https://stackoverflow.com/questions/4620549/convert-unicode-into-character-with-ruby

# see also: unicode spaces
# http://jkorpela.fi/chars/spaces.html

# convert unicode to int using unpack
def demo_unicode_char_to_int
  p '立つ　だつ　'.unpack('U*')
end

# source
# http://www.rubyinside.com/the-split-is-not-enough-whitespace-shenigans-for-rubyists-5980.html
# a hack that replaces unicode space characters (using the space
# class) with ascii space
def demo_unicode_split
  p '立つ　だつ　'.gsub(/[[:space:]]/, ' ').split
end

demo_unicode_char_to_int
demo_unicode_split
