#!/usr/bin/env ruby

# see:
# https://github.com/github/rubocop-github/blob/master/STYLEGUIDE.md
# http://tomdoc.org/

# see also: how to set tab width per file/code format
# https://stackoverflow.com/questions/34247939/how-to-set-per-filetype-tab-size
# "[ruby]": {
#   "editor.tabSize": 2
# }

# block
# comments

=begin
also
block
comment (but discouraged by IDE)
=end

# a generator function
def generator
  x = 5 # inline comments
  puts '# not comment in quote'
  puts "interpolation: #{x}"
end

class Generator
  # class docstring...
end

generator
